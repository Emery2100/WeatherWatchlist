//
//  WeatherViewModel.swift
//  WeatherWatchlist
//
//  Created by David Emery on 4/20/26.
//

import Foundation
import SwiftData

@MainActor
final class WeatherViewModel: ObservableObject {
    
    @Published var temps: [PersistentIdentifier: Double] = [:]
    @Published var isLoading = false
    
    private let service = WeatherService()
    
    /// Fetch weather for all saved locations
    func fetchWeather(for locations: [SavedLocation]) async {
        isLoading = true
        
        for location in locations {
            do {
                let temp = try await service.fetchTemperature(
                    lat: location.latitude,
                    lon: location.longitude
                )
                
                temps[location.persistentModelID] = temp
                
            } catch {
                print("Failed to fetch for \(location.name):", error)
            }
        }
        
        isLoading = false
    }
    
    /// Temperature difference from baseline
    func delta(for location: SavedLocation) -> Double? {
        guard let current = temps[location.persistentModelID] else { return nil }
        return current - location.baselineTemp
    }
    
    /// Percent change from baseline
    func percentChange(for location: SavedLocation) -> Double? {
        guard let delta = delta(for: location),
              location.baselineTemp != 0 else { return nil }
        
        return (delta / location.baselineTemp) * 100
    }
}
