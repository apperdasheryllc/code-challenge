//
//  SearchView.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var store: MyStore
    
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
