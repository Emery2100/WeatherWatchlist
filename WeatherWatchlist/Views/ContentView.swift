//
//  ContentView.swift
//  WeatherWatchlist
//
//  Created by David Emery on 4/20/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var locations: [SavedLocation]
    @StateObject private var vm = WeatherViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(locations) { location in
                    LocationRow(location: location, vm: vm)
                }
            }
            .navigationTitle("Weather Watchlist")
            .task {
                await vm.fetchWeather(for: locations)
            }
        }
    }
}
