//
//  AppCommand.swift
//  ReduxAsyncDemo
//
//  Created by Yong Jin on 2022/4/29.
//

import Foundation

protocol AppCommand {
    func execute() async throws -> AppAction
}

extension AppState {
    
}

struct AppCommand_Print: AppCommand {
    var number: Int
    func execute() async throws-> AppAction {
        print(number)
        
        return .empty
    }
}

struct AppCommand_GetJSON: AppCommand {
    var url: URL
    
    func execute() async throws -> AppAction {
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let string = String(data: data, encoding: .utf8) ?? "NULL"
        
        return .setString(string: string)
    }
}

struct AppCommand_RandomNumber: AppCommand {
    
    var state: AppState
    
    func execute() async throws -> AppAction {
        var newState = state
        newState.number = Int(arc4random_uniform(100))
        
        return .setState(state: newState)
    }
}
