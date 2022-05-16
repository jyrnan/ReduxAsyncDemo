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
    
    /// <#Description#>
    /// - Parameter action: 动作类型描述
    func dispatch(_ action: AppAction) {
        
        //根据Action执行获得相应可能的Command
        if let command = reduce(state: &appState, action: action) {
            
            // 如果有command则继续执行，command默认是异步执行，所以需要包在Task中
            Task {
                do {
                    
                    //异步执行command，默认产生action
                    let action = try await command.execute()
                    
                    //继续递归执行由command产生的action，
                    //一般是对command执行后产生的数据的处理，
                    //如果是.empty类型action，则表示无需后续处理，处理链结束
                    dispatch(action)
                    
                } catch {
                    print(error)
                }
            }
        }
    }
}

