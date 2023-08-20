//
//  ContentView.swift
//  SwiftMemorize
//
//  Created by José Lagos Guevara on 19-08-23.
//

import SwiftUI

struct ContentView: View {
    var myArray = [0,1,2,3,4].shuffled()
    var body: some View {
        HStack {
            ForEach(0..<myArray.count, id:\.self) { index in
                CardView(arrayNumber: myArray[index])
            }
        }.foregroundColor(.purple)
            .padding()
        
        
    }
}



struct CardView: View {
    var isFaceUp: Bool = true
    var arrayNumber: Int
    
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius:12).foregroundColor(.white)
                RoundedRectangle(cornerRadius:12).strokeBorder(lineWidth: 2)
                Text("\(arrayNumber)").font(.largeTitle)
                
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
