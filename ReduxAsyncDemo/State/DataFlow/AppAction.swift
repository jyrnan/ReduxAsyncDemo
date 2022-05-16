//
//  AppAction.swift
//  ReduxAsyncDemo
//
//  Created by Yong Jin on 2022/4/29.
//

import Foundation

enum AppAction {
    case empty
    
    case setState(state: AppState)
    
    case setNumber(number: Int)
    case setString(string: String)
    
    case getJSON(url: URL)
    
    case generateRandomNumber
    
}
