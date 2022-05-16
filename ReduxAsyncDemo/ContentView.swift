//
//  ContentView.swift
//  ReduxAsyncDemo
//
//  Created by Yong Jin on 2022/4/29.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store
    
    @AppStorage("isLogined") var isLogined: Bool = true
    
    var body: some View {
        NavigationView{
            
            ScrollView{
                
                VStack{
                    Text(store.appState.string)
                        .padding()
                    
                    Text("\(isLogined == true ? "Logined" : "Not login"):  \(store.appState.number)")
                        .padding()
                    
                    Button {
                        isLogined.toggle()
                    } label: {
                        Text("Up")
                            .padding()
                    }
                    
                    Button {
                        store.dispatch(.getJSON(url: URL(string: "https://www.twitter.com")!))
                        
                    } label: {
                        Text("getJSON")
                            .padding()
                    }
                }
                
            }
            .background(isLogined == true ? Color.orange : Color.red)
            .navigationTitle("ReduxDemo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @AppStorage(wrappedValue: false, "isLogined") var isLogined
    static var previews: some View {
        ContentView()
            .environmentObject(Store())
    }
}
