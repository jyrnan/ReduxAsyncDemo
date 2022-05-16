//
//  Store+Reduce.swift
//  ReduxAsyncDemo
//
//  Created by Yong Jin on 2022/5/1.
//

import Foundation

extension Store {
    
    // reduce的作用看起来应该是两块：
    // 一是可以接受从action里面带过来的数据，并更新到state里面
    // 二是生成一个副作用的appCommand来进行异步操作
    func reduce(state: inout AppState, action: AppAction) -> AppCommand? {
        var appCommand: AppCommand?
        
        switch action {
        
        //不执行任何操作
        case .empty:		
            break
        
        // 更新整个state数据
        case .setState(let newState):
            state = newState
        
            
        case .setNumber(let number):
            appCommand = AppCommand_Print(number: number)
            
        case .setString(let string):
            state.string = string
            
        case .getJSON(let url):
            appCommand = AppCommand_GetJSON(url: url)
            
        case .generateRandomNumber:
            appCommand = AppCommand_RandomNumber(state: state)
            
        }
        
        return appCommand
     }
}
