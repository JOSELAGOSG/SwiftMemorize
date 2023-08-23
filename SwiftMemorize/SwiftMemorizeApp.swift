//
//  SwiftMemorizeApp.swift
//  SwiftMemorize
//
//  Created by José Lagos Guevara on 19-08-23.
//

import SwiftUI

@main
struct SwiftMemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
