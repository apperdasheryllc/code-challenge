//
//  LocalSearchBar.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import Foundation
import SwiftUI

struct LocalSearchBar: UIViewRepresentable {
    @Binding var text: String
    let onSearch: () -> Void
    
    public init(text: Binding<String>, onSearch: @escaping () -> Void) {
        _text = text
        self.onSearch = onSearch
    }
    
    public func makeCoordinator() -> SearchCoordinator {
        return SearchCoordinator(text: $text, onSearch: onSearch)
    }
    
    public func makeUIView(context: UIViewRepresentableContext<LocalSearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        return searchBar
    }
    
    public func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<LocalSearchBar>) {
        uiView.text = text
    }
}
