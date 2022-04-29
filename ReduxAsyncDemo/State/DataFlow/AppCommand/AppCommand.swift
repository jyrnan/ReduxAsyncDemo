//
//  AppCommand.swift
//  ReduxAsyncDemo
//
//  Created by Yong Jin on 2022/4/29.
//

import Foundation

protocol AppCommand {
    func execute(in store: Store) -> AppAction
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
