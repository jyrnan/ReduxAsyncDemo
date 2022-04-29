//
//  ContentView.swift
//  ReduxAsyncDemo
//
//  Created by Yong Jin on 2022/4/29.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        ScrollView{
            
            
        VStack{
            Text(store.appState.string)
                .padding()
            Text("Hello, world! \(store.appState.number)")
                .padding()
            Button {
                store.dispatch(.increaseNumber(number: 1))
            } label: {
                Text("Up")
            }
            Button {
                store.dispatch(.getJSON)
            } label: {
                Text("getJSON")
            }
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var store = Store()
    static var previews: some View {
        ContentView()
            .environmentObject(store)
    }
}
