//
//  Store.swift
//  ReduxAsyncDemo
//
//  Created by Yong Jin on 2022/4/29.
//

import Foundation

@MainActor
class Store: ObservableObject {
    @Published private(set) var appState = AppState()
    
    func dispatch(_ action: AppAction) {
        
        if let command = reduce(state: &appState, action: action) {
            Task {
                do {
                    let action = try await command.execute(in: self)
                    dispatch(action)
                } catch {
                    print(error)
                }
            }
        }
    }
}

extension Store {
    
    func reduce(state: inout AppState, action: AppAction) -> AppCommand? {
        var appCommand: AppCommand?
        
        switch action {
        case .empty:
            break
            
        case .increaseNumber(let number):
            state.number += number
            appCommand = AppCommand_Print(number: number)
            
        case .updateString(let string):
            state.string = string
            
        case .getJSON:
            appCommand = AppCommand_GetJSON()
            
        }
        
        return appCommand
     }
}
