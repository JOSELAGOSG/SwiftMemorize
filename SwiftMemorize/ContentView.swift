//
//  ContentView.swift
//  SwiftMemorize
//
//  Created by José Lagos Guevara on 19-08-23.
//

import SwiftUI

struct ContentView: View {
    @State var currentEmojis: Array<String> = []
    
    
    let halloweenEmojis: Array<String> = ["🎃", "👻", "🕷️", "💀","🪦", "☠️", "⚰️", "🕸️"]
    let ballsEmojis: Array<String> = ["🥎", "🎱", "🎾", "🏀", "🏉", "🏈"]
    
    let vehiclesEmojis: Array<String> = ["⛴️", "🛥️", "🚀", "🚁", "🚂", "🚃", "🛩️", "🚄", "🚗", "🚚", "🚜"]
    
    let flagsEmojis: Array<String> = ["🇿🇦", "🇻🇦", "🇳🇦", "🇧🇦", "🇧🇷"]
    
    
    
    var body: some View {
        
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {cards}
            themeChoosingButtons
            Spacer()

        }
        
    }
    
    var themeChoosingButtons: some View {
        HStack(spacing: 30.0) {
            Button(action: {currentEmojis = ballsEmojis}, label: {VStack{Image(systemName: "basketball.fill")
                Text("Balls")}})
            Button(action: {currentEmojis = flagsEmojis}, label: {VStack{Image(systemName: "flag.2.crossed.circle.fill")
                Text("Flags")}})
            Button(action: {currentEmojis = vehiclesEmojis}, label: {VStack{Image(systemName: "car.fill")
                Text("Vehicles")}})
            Button(action: {currentEmojis = halloweenEmojis}, label: {VStack{Image(systemName: "moonphase.new.moon")
                Text("Halloween")}})
        }
        .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
        
        
        
    }
    

    
    var cards: some View {
        let emojisWithPairsShuffled: Array<String> = (currentEmojis + currentEmojis).shuffled()
        return(
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 60))]) {
            ForEach(0..<emojisWithPairsShuffled.count, id:\.self) { index in
            StringCardView(isFaceUp: false, emoji: emojisWithPairsShuffled[index])
                    .aspectRatio(2/3 ,contentMode: .fit)
            }
        }.foregroundColor(.purple).padding())
    }
    
}

 
struct StringCardView: View {
    @State var isFaceUp: Bool
    var emoji: String
    var body: some View {
        ZStack() {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text("\(emoji)").font(.largeTitle)
            }
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}





















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
