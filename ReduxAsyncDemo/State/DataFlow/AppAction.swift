//
//  AppAction.swift
//  ReduxAsyncDemo
//
//  Created by Yong Jin on 2022/4/29.
//

import Foundation

enum AppAction {
    case empty
    
    case increaseNumber(number: Int)
    case updateString(string: String)
    
    case getJSON
    
}
