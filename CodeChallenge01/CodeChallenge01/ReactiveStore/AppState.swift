//
//  AppState.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import Foundation

protocol MyState {}

struct AppState: MyState {
    var counter: Int = 0
    var searchQuery: String = ""
    var alertInfo: AlertInfo?
}
