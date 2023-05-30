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
            Text(store.state.selectedLocation?.name ?? "")
                .font(.title2)
            Text(store.state.currentWeatherMain)
                .font(.title3)
            Text(store.state.currentWeatherDescription)
                .font(.subheadline)
            Text(store.state.currentTempString)
                .font(.title)
            
            if let url = URL(string: store.state.currentWeatherIconUrl) {
                AsyncImage(url: url)
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
