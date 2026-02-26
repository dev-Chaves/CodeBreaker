//
//  ContentView.swift
//  CodeBreaker
//
//  Created by João Vitor Chaves on 18/02/26.
//

import SwiftUI

struct CodeBreakerView: View {
    
    @State var game: CodeBreaker = CodeBreaker(pegChoices: [.red, .green, .indigo, .purple])
    
    var body: some View {
        VStack{
            
            Text("CodeBreaker")
                .font(.largeTitle)
                .bold()
                .italic()
            
            view(for: game.masterCode)
            ScrollView{
                
                view(for: game.guess)
                
                ForEach(game.attempts.indices.reversed(), id: \.self) {
                    index in view(for: game.attempts[index])
                }
            }
        }
        .padding()
    }
    
    var guessButton: some View{
        Button("Guess"){
            withAnimation {
                game.attemptGuess()
            }
        }.font(.system(size: 80))
            .minimumScaleFactor(0.1)
    }
    
    func view (for code: Code) -> some View {
        HStack{
            ForEach(code.pegs.indices, id: \.self, content: {index in
                RoundedRectangle(cornerRadius: 10)
                    .overlay{
                        if(code.pegs[index] == Code.missing){
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.gray)
                        }
                    }
                    .contentShape(Rectangle())
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundColor(code.pegs[index])
                    .onTapGesture {
                        if(code.kind == .guess){
                            game.changeGuessPeg(at: index)
                        }
                    }
            })
            MatchMakers(matches: code.matches)
                .overlay{
                    if code.kind == .guess{
                        guessButton
                    }
                }
        }.padding()
    }
    
}

#Preview {
    CodeBreakerView()
}
