//
//  SearchCoordinator.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import Foundation
import SwiftUI

class SearchCoordinator: NSObject, UISearchBarDelegate {
    @Binding var text: String
    let searchButtonClicked: () -> Void
    
    init(text: Binding<String>, onSearch: @escaping () -> Void) {
        _text = text
        self.searchButtonClicked = onSearch
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        text = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchButtonClicked()
    }
}
