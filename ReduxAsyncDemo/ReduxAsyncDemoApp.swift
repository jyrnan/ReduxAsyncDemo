//
//  ReduxAsyncDemoApp.swift
//  ReduxAsyncDemo
//
//  Created by Yong Jin on 2022/4/29.
//

import SwiftUI

@main
struct ReduxAsyncDemoApp: App {
    @StateObject var store: Store
    
    @AppStorage("isLogined") var isLogined: Bool = false
    
    init(){
        _store = StateObject(wrappedValue: Store())
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}


