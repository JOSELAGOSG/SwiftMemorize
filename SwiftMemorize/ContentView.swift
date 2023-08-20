//
//  ContentView.swift
//  SwiftMemorize
//
//  Created by José Lagos Guevara on 19-08-23.
//

import SwiftUI

struct ContentView: View {
    var myArray = [0,1,2,3,4,5,6,7,8].shuffled()
    @State var cardCount: Int = 4
    let halloweenEmojis: Array<String> = ["🎃", "👻", "🕷️", "💀","🪦", "☠️", "⚰️", "🕸️"]
    
    var body: some View {
        VStack {
            ScrollView {cards}
            Spacer()
            cardCountAdjusters

        }
        
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }.padding()
         .font(.largeTitle)
         .imageScale(.large)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {cardCount += offset}, label: {Image(systemName: symbol)})
            .disabled(cardCount + offset < 1 || cardCount + offset > halloweenEmojis.count)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cards: some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id:\.self) { index in
            StringCardView(isFaceUp: true, emoji: halloweenEmojis[index])
                    .aspectRatio(2/3 ,contentMode: .fit)
            }
        }.foregroundColor(.purple).padding()
    }
    
}

 
struct StringCardView: View {
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
