//
//  WeatherService.swift
//  WeatherWatchlist
//
//  Created by David Emery on 4/20/26.
//

import Foundation

final class WeatherService {
    
    /// Fetch current temperature using Open-Meteo API
    func fetchTemperature(lat: Double, lon: Double) async throws -> Double {
        
        var components = URLComponents(string: "https://api.open-meteo.com/v1/forecast")!
        
        // Safe URL building
        components.queryItems = [
            URLQueryItem(name: "latitude", value: "\(lat)"),
            URLQueryItem(name: "longitude", value: "\(lon)"),
            URLQueryItem(name: "current", value: "temperature_2m")
        ]
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoded = try JSONDecoder().decode(WeatherResponse.self, from: data)
        
        return decoded.current.temperature_2m
    }
}
