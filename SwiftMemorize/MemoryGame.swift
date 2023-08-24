//
//  MemorizeGame.swift
//  SwiftMemorize
//
//  Created by José Lagos Guevara on 22-08-23.
//

import Foundation




struct Theme {
    var name: String
    var emojis: Array<String>
    var numberOfPairsOfCards: Int
    var color: String
        
    init(_ name: String, _ emojis: Array<String>, _ numberOfPairsOfCards: Int, _ color: String){
        self.name = name
        self.emojis = emojis.shuffled()
        self.color = color
        
        if numberOfPairsOfCards > emojis.count {
            self.numberOfPairsOfCards = emojis.count
        } else {
            self.numberOfPairsOfCards = numberOfPairsOfCards
        }
        
    }
}



struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    private(set) var score: Int = 0
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
        cards.shuffle()
    }
    
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    cards[chosenIndex].tapsCount += 1
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        score += 2
                    } else {
                        if cards[chosenIndex].tapsCount >= 2 || cards[potentialMatchIndex].tapsCount >= 2 {
                            score -= 1
                        }
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                    cards[chosenIndex].tapsCount += 1
                }
                
                
                cards[chosenIndex].isFaceUp = true
            }
            
            
        }
    }
    
    
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        var isFaceUp = false
        var isMatched = false
        var tapsCount = 0
        let content: CardContent
        
        var id: String
        
        
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down")\(isMatched ? "matched": "") TapsCount:\(tapsCount)"
        }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
