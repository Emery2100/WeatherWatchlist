//
//  LocationRow.swift
//  WeatherWatchlist
//
//  Created by David Emery on 4/20/26.
//

import SwiftUI

struct LocationRow: View {
    
    let location: SavedLocation
    @ObservedObject var vm: WeatherViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            Text(location.name)
                .font(.headline)
            
            if let temp = vm.temps[location.persistentModelID] {
                
                Text("Current: \(temp, specifier: "%.1f")°C")
                
                if let delta = vm.delta(for: location),
                   let percent = vm.percentChange(for: location) {
                    
                    Text("Δ: \(delta, specifier: "%.1f")°C (\(percent, specifier: "%.1f")%)")
                        .foregroundColor(delta >= 0 ? .red : .blue)
                }
                
            } else {
                Text("Loading...")
                    .foregroundColor(.gray)
            }
            
            if let note = location.note {
                Text(note)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}
