//
//  ContentView.swift
//  Ceelo
//
//  Created by Ethan Uzarowski on 2/8/20.
//  Copyright © 2020 Ethan Uzarowski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var game = Game()
    @State var die1 = -1
    @State var die2 = -1
    @State var die3 = -1
    
    var body: some View {
        VStack() {
            HStack {
                Die(result: die1)
                    .padding(.horizontal, 10.0)
                    .font(.title)
                Die(result: die2)
                    .padding(.horizontal, 10.0)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Die(result: die3)
                    .padding(.horizontal, 10.0)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .padding(.vertical, 50.0)
            .padding(.horizontal, 25.0)
            
            Button(action: {
                self.game.buttonClicked()
                
                // sync UI with game
                self.die1 = self.game.die1
                self.die2 = self.game.die2
                self.die3 = self.game.die3
            }) {
                Text("Roll")
                    .padding(.vertical, CGFloat(50))
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(width: 100.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
