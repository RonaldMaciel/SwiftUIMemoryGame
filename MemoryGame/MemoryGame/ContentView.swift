//
//  ContentView.swift
//  MemoryGame
//
//  Created by Ronald on 17/11/23.
//

import SwiftUI

struct ContentView: View {
    
    var emojis =  ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐵","🐔","🐧","🐦","🐤","🐣","🐥","🦆","🦅","🦉","🦇","🐺","🐗","🐴","🦄","🐝","🐛","🦋","🐌"]
    
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(.purple)
    }

    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }

    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        let card = RoundedRectangle(cornerRadius: 25)
        
        ZStack {
            if isFaceUp {
                card.fill().foregroundColor(.white)
                card.stroke(lineWidth: 3)
                
                Text(content)
                    .font(.largeTitle)
            } else {
                card.fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 15 Pro")
    }
}


