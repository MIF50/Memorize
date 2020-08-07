//
//  ContentView.swift
//  Memorize
//
//  Created by BeInMedia on 8/7/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import SwiftUI

// create cardView
struct CardView: View {
    
    @State var isFaceUp : Bool
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()

            }
        }
        .foregroundColor(.orange)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(0..<7){ row in
                HStack {
                    ForEach(0..<4){ column in
                        CardView(isFaceUp: (row) % 2 == 0)
                    }
                }
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
