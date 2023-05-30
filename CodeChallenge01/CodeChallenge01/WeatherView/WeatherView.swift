//
//  WeatherView.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/29/23.
//

import SwiftUI

struct WeatherView: View {
    @EnvironmentObject var store: MyStore
    
    var body: some View {
        VStack {
            Text("Weather View")
            Text(store.state.selectedLocation?.name ?? "")
            Text(store.state.currentWeatherMain)
            Text(store.state.currentWeatherDescription)
            Text(store.state.currentTempString)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
