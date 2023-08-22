//
//  ContentView.swift
//  SwiftMemorize
//
//  Created by José Lagos Guevara on 19-08-23.
//

import SwiftUI

struct ContentView: View {

    let emojis: Array<String> = ["🎃", "👻", "🕷️", "💀","🪦", "☠️", "⚰️", "🕸️"]
    
    var body: some View {
        
        ScrollView {cards}
    
    }
    
    
    var cards: some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id:\.self) { index in
            CardView(isFaceUp: true, emoji: emojis[index])
                    .aspectRatio(2/3 ,contentMode: .fit)
            }
        }.foregroundColor(.purple).padding()
    }
    
}

 
struct CardView: View {
    @State var isFaceUp: Bool
    @State var emoji: String
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


struct IntCardView: View {
    @State var isFaceUp: Bool = true
    @State var arrayNumber: Int
    
    var body: some View {
        ZStack() {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text("\(arrayNumber)").font(.largeTitle)
                
            } else {
                base
                
            }
        }
        .onTapGesture {
            arrayNumber += 2
            isFaceUp.toggle()
        }
    }
}


















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
