//
//  MatchMakers.swift
//  CodeBreaker
//
//  Created by João Vitor Chaves on 18/02/26.
//

import SwiftUI

struct MatchMakers: View {
    
    var matches: [Match]
    
    var body: some View {
        
        HStack{
            VStack{
                matchMaker(peg: 0)
                matchMaker(peg: 1)
            }
            VStack{
                matchMaker(peg: 2)
                matchMaker(peg: 3)
            }
        }
    }
    
    func matchMaker(peg: Int) -> some View {
        
        let exactCount = matches.count {$0 == .exact}
        
        /**
         let miniExactCount: Int = matches.count(where: {match in match == .exact})
         
         let longExactCount: Int = matches.count(where: {(match: Match) -> Bool in match == .exact})
         
         let moreLongExactCount: Int = matches.count(where: isExact)
         
         func isExact(match: Match) -> Bool {
             
             return match == Match.exact
         }
         */
        
        
        let foundCount: Int = matches.count {$0 != .nomatch }
                
        return  Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)
            .aspectRatio(1, contentMode: .fit)
        
    }
    
}

enum Match {
    case nomatch
    case exact
    case inexact
}

#Preview {
    MatchMakers(matches: [.exact, .inexact, .nomatch])
}
