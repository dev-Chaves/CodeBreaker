//
//  ContentView.swift
//  CodeBreaker
//
//  Created by João Vitor Chaves on 18/02/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            
            Text("Code Breaker").font(.largeTitle).bold().italic()
            
            pegs(colors: [.red , .blue, .green, .purple])
            pegs(colors: [.green , .blue, .red, .purple])
            pegs(colors: [.red , .green, .blue, .purple])
            pegs(colors: [.purple , .blue, .green, .red])
            
        }.padding()
        
    }
    
    func pegs (colors: Array<Color>) -> some View {
        HStack{
            
            ForEach(colors.indices, id: \.self, content: {index in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundColor(colors[index])
            })
            
            MatchMakers(matches: [.exact, .inexact, .nomatch])
            
        }.padding()
    }
}

#Preview {
    ContentView()
}
