//
//  ContentView.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import CoreLocationUI
import SwiftUI

let weatherView = WeatherView()

struct ContentView: View {
    @EnvironmentObject var store: MyStore
    
    var body: some View {
        NavigationSplitView {
            SearchView()
        } detail: {
            weatherView
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
