//
//  ContentView.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: MyStore
    
    var body: some View {
        VStack {
            SearchView()
            Text("search: \(store.state.searchQuery)")
            Text("count: \(store.state.counter)")
        }
        .padding()
        .onTapGesture {
            store.dispatch(.didTap)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
