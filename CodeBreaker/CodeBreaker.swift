//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by João Vitor Chaves on 24/02/26.
//

import SwiftUI

typealias Peg = Color

struct CodeBreaker {
    
    var masterCode: Code = Code(kind: .master)
    var guess: Code = Code(kind: .guess)
    var attempts: [Code] = [Code]()
    let pegChoices: [Peg]
    
    init (pegChoices: [Peg] = [
        .red, .yellow, .blue, .green
    ]){
        self.pegChoices = pegChoices
        masterCode.randomize(from: pegChoices)
        print(masterCode)
    }
        
    mutating func changeGuessPeg(at index: Int){
        let existingPeg = guess.pegs[index]
        if let indexOfExistingPegChoices = pegChoices.firstIndex(of: existingPeg){
            let newPeg = pegChoices[(indexOfExistingPegChoices + 1) % pegChoices.count]
            guess.pegs[index] = newPeg
        }else {
            guess.pegs[index] = pegChoices.first ?? Code.missing
        }
    }
    
    mutating func attemptGuess(){
        var attempt = guess
        attempt.kind = .attempt(guess.match(against: masterCode))
        attempts.append(attempt)
    }
    
}

struct Code {
    
    var kind: Kind
    var pegs: [Peg] = Array(repeating: Code.missing, count: 4)
    static let missing: Peg = .clear
    
    enum Kind: Equatable{
        case master
        case guess
        case attempt([Match])
        case unknown
    }
    
    mutating func randomize(from pegChoices: [Peg]) {
        for index in pegs.indices {
            pegs[index] = pegChoices.randomElement() ?? Code.missing
        }
    }
    
    var matches: [Match] {
        switch kind{
        case .attempt(let matches): return matches
        default: return []
        }
    }
    
    func match(against otherCode: Code) -> [Match] {
        var result: [Match] = Array(repeating: .nomatch, count: pegs.count)
        var pegsToMatch: [Peg] = otherCode.pegs
        
        for index in pegs.indices.reversed() {
            if pegsToMatch.count > index, pegsToMatch[index] == pegs[index] {
                result[index] = .exact
                pegsToMatch.remove(at: index)
            }
        }
        
        for index in pegs.indices.reversed() {
            if(result[index] != .exact){
                if let matchIndex = pegsToMatch.firstIndex(of: pegs[index]){
                    result[index] = .inexact
                    pegsToMatch.remove(at: matchIndex)
                }
            }
        }
        
        return result
        
    }
}

