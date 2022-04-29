//
//  AppCommand.swift
//  ReduxAsyncDemo
//
//  Created by Yong Jin on 2022/4/29.
//

import Foundation

protocol AppCommand {
    func execute(in store: Store) async throws -> AppAction
}

extension AppState {
    
}

struct AppCommand_Print: AppCommand {
    var number: Int
    func execute(in store: Store) -> AppAction {
        print(number)
        
        return .empty
    }
}

struct AppCommand_GetJSON: AppCommand {
    func execute(in store: Store) async throws -> AppAction {
        let url = URL(string: "https://www.apple.com")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let string = String(data: data, encoding: .utf8) ?? "NULL"
        
        return .updateString(string: string)
    }
}
