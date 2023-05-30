//
//  SearchView.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import CoreLocationUI
import SwiftUI

struct SearchView: View {
    @EnvironmentObject var store: MyStore
    
    @State private var searchNavigation = SearchNavigation()
    
    var searchQueryBinding: Binding<String> {
        Binding {
            return store.state.searchQuery
        } set: { newValue in
            store.dispatch(.search(text: newValue))
        }
    }
    
    var alertBinding: Binding<AlertInfo?> {
        Binding {
            return store.state.alertInfo
        } set: { newValue in
        }
    }
    
    var body: some View {
        VStack {
            LocalSearchBar(text: searchQueryBinding, onSearch: handleSearch)
            
            List(
                store.state.geocodeLocations,
                selection: $searchNavigation.geocodeLocation
            ) { location in
                NavigationLink(value: location) {
                    VStack(alignment: .leading) {
                        Text(location.name)
                        
                        HStack {
                            Text(location.state ?? "")
                            Text(location.country)
                        }
                        .font(.subheadline)
                    }
                }
            }
            .onChange(of: searchNavigation, perform: { newValue in
                if let location = newValue.geocodeLocation {
                    store.dispatch(.didSelect(location))
                }
            })
            .navigationDestination(for: GeocodeLocationJSON.self) { location in
                weatherView
            }
            
            Text("search: \(store.state.searchQuery)")
            Text("count: \(store.state.counter)")
        }
        .navigationTitle("Search")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                LocationButton() {
                    store.dispatch(.requestedLocation)
                }
            }
        }
        .alert(item: alertBinding) { details in
            Alert(
                title: Text(details.title),
                message: Text(details.description),
                dismissButton: .default(Text("Dismiss"), action: handleDismissButton)
            )
        }
    }
    
    func handleSearch(){
        store.dispatch(.startGeocodingRequest)
    }
    
    func handleDismissButton() {
        store.dispatch(.dismissAlert)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
