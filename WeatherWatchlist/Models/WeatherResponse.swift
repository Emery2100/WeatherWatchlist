//
//  WeatherResponse.swift
//  WeatherWatchlist
//
//  Created by David Emery on 4/20/26.
//

import Foundation

struct WeatherResponse: Codable {
    let current: CurrentWeather
    
    struct CurrentWeather: Codable {
        let temperature_2m: Double
    }
}
