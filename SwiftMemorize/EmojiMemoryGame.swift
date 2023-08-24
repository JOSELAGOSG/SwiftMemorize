//
//  EmojiMemoryGame.swift
//  SwiftMemorize
//
//  Created by José Lagos Guevara on 22-08-23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    @Published var theme: Theme
    @Published private var model: MemoryGame<String>
    @Published var cardsColor: Color
    private let themes: Array<Theme>
    
    init(){
        
        func createMemoryGame(_ theme: Theme) -> MemoryGame<String> {
            
            
            
            return MemoryGame(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
                if theme.emojis.indices.contains(pairIndex) {
                    return theme.emojis[pairIndex]
                } else {
                    return "X"
                }
                
            }
            
        }
        themes = [
            Theme("Halloween", ["🎃", "👻", "🕷️", "💀","🪦", "☠️", "⚰️", "🕸️"], 4, "orange"),
            Theme("Balls", ["⚽", "🥎", "🏀", "🏐", "🏈", "🎱", "🎾", "🏉"], 10, "blue"),
            Theme("Vehicles", ["⛴️", "🛥️", "🚀", "🚁", "🚂", "🚃", "🛩️", "🚄", "🚗", "🚚", "🚜"], 10, "red"),
            Theme("Music", ["🎹", "🎼", "🎶", "🎵", "🎤", "🎺"], 80, "gray")
        ]
        let localTheme = themes.randomElement() ?? themes[0]
        theme = localTheme
        model = createMemoryGame(localTheme)
        
        switch localTheme.color {
        case "orange":
            cardsColor = .orange
        case "blue":
            cardsColor = .blue
        case "red":
            cardsColor = .red
        case "gray":
            cardsColor = .gray
        default:
            cardsColor = .green
        }
        
        
    }
    
    
     
    
    
    func newGame() {
        func createMemoryGame(_ theme: Theme) -> MemoryGame<String> {
            
            
            
            return MemoryGame(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
                if theme.emojis.indices.contains(pairIndex) {
                    return theme.emojis[pairIndex]
                } else {
                    return "X"
                }
                
            }
            
        }
        theme = themes.randomElement() ?? themes[0]
        model = createMemoryGame(theme)
        switch theme.color {
        case "orange":
            cardsColor = .orange
        case "blue":
            cardsColor = .blue
        case "red":
            cardsColor = .red
        case "gray":
            cardsColor = .gray
        default:
            cardsColor = .green
        }
        
    }
    
    var score: Int {
        return model.score
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
