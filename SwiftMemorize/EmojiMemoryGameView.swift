//
//  EmojiMemoryGameView.swift
//  SwiftMemorize
//
//  Created by José Lagos Guevara on 19-08-23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    
    var body: some View {
        VStack{
            ScrollView {cards}
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        
    }
    
    
    var cards: some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id:\.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3 ,contentMode: .fit)
                    .padding(4)
            }
        }.foregroundColor(.purple).padding()
    }
    
}

 
struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack() {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                
            } .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
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


















struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}