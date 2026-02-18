//
//  ContentView.swift
//  CodeBreaker
//
//  Created by João Vitor Chaves on 18/02/26.
//

import SwiftUI

struct ContentView: View {
    
    var helloWord: String = "Hello, World!"
    
    var count: Int = 0
    
    var test: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 64, content: greetings)
        .padding()
        
        something
    }
    
    var something: some View {
        HStack{
            if(test == true){
                Text("Hello!")
            }else{
                Text("Not True")
            }
            
            
        }
    }
    
    func counting(i: Int) -> Int{
        return i + 1
    
    }
    
    @ViewBuilder
    func greetings() -> some View {
        Image(systemName: "globe").font(.largeTitle)
        Text("Hello down there!").font(.largeTitle)
        Circle().padding().frame(width: 100, height: 100)
    }
    
    func bolinhas () -> some View {
        HStack{
            Circle()
            Circle()
            Circle()
            Circle()
        }
    }
}

#Preview {
    ContentView()
}
