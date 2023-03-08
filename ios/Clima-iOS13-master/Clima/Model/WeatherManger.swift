//
//  WeatherManger.swift
//  Clima
//
//  Created by Sachiththa Bandaranayake on 2023-02-18.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManger {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=c1ba11f671daff779303cc8649d1fa9c"
    
    func fetchWeather(city: String) {
        let urlString = "\(weatherUrl)&q=\(city)"
        performRequest(urlString: urlString)
    }
    
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
            task.resume()
        }
    }
    
    
    func handle(data: Data?, response: URLResponse?, error: Error?) -> Void {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
