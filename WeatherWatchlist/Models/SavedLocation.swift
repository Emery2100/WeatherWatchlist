//
//  SavedLocation.swift
//  WeatherWatchlist
//
//  Created by David Emery on 4/20/26.
//

import SwiftData

@Model
class SavedLocation {
    var name: String
    var latitude: Double
    var longitude: Double
    var baselineTemp: Double
    var note: String?
    
    init(name: String, latitude: Double, longitude: Double, baselineTemp: Double, note: String? = nil) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.baselineTemp = baselineTemp
        self.note = note
    }
}
