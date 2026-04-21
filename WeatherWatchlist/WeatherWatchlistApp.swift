//
//  WeatherWatchlistApp.swift
//  WeatherWatchlist
//
//  Created by David Emery on 4/20/26.
//

import SwiftUI
import SwiftData

@main
struct WeatherWatchlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: SavedLocation.self)
    }
}
