import Foundation
import CoreLocation
protocol WeatherManagerDelegate{
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    
    func didThrowError(_ error: Error)
}
struct WeatherManager{
    
    var delegate: WeatherManagerDelegate?
    
    let weatherURL: String = "https://api.openweathermap.org/data/2.5/weather?appid=04720e6c5a6808a994667a251ec0199a&units=metric"
    
    func fetchWeather(latitude: CLLocationDegrees, longitide: CLLocationDegrees) {
        let targetURL = weatherURL.appending("&lat=\(latitude)&lon=\(longitide)")
        network(urlSting: targetURL)
    }
    
    func fetchWeather(cityName: String) {
        let targetURL = weatherURL.appending("&q=\(cityName)")
        network(urlSting: targetURL)
    }
    
    func network(urlSting: String){
        if let targetURL = URL(string: urlSting){
        let sessionObj = URLSession(configuration: .default)
            print(targetURL)
        
            let task = sessionObj.dataTask(with: targetURL) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData: safeData){
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
            
        }
    }
        
    func parseJSON(safeData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        
        do{
            do{
                let respObj = try decoder.decode(WeatherData.self, from: safeData)
                let id = respObj.weather[0].id
                let tmp = respObj.main.temp
                let name = respObj.name
                
                let weather = WeatherModel(cityName: name, conditonID: id, temperature: tmp)
                return weather
            }catch{
                print(error)
                return nil
            }
        }
    }
    
    }
    

