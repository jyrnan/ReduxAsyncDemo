//
//  Store.swift
//  ReduxAsyncDemo
//
//  Created by Yong Jin on 2022/4/29.
//

import Foundation


class Store: ObservableObject {
    @Published var appState = AppState()
    
    func dispatch(_ action: AppAction) {
        
        let result = reduce(state: appState, action: action)
        appState = result.0
        if let command = result.1 {
            let action = command.execute(in: self)
            dispatch(action)
        }
    }
}

extension Store {
    
    func reduce(state: AppState, action: AppAction) -> (AppState, AppCommand?){
        var appState = state
        var appCommand: AppCommand?
        
        switch action {
        case .empty:
            break
            
        case .increaseNumber(let number):
            appState.number += number
            appCommand = AppCommand_Print(number: number)
        }
        
        return (appState, appCommand)
     }
}
