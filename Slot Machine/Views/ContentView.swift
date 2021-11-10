//
//  ContentView.swift
//  Slot Machine
//
//  Created by Natraj, Rohit on 11/10/21.
//

import SwiftUI
// MARK: - Properties
struct ContentView: View {
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // Interface
            
            // PopUp
            VStack(alignment: .center, spacing: 5) {
                // Header
                LogoView()
                
                Spacer()
                
                // Score
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        
                        Text("100")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("200")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)

                    }
                    .modifier(ScoreContainerModifier())
                }
                
                // Slot Machine
                
                VStack(alignment: .center, spacing: 0) {
                    // Reel #1
                    ZStack {
                        ReelView()
                        Image("gfx-bell")
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        // Reel #2
                        ZStack {
                            ReelView()
                            Image("gfx-seven")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        
                        Spacer()
                        
                        // Reel #3
                        ZStack {
                            ReelView()
                            Image("gfx-cherry")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                    }
                    .frame(maxWidth: 500)
                    
                    // Spin Button
                    Button(action: {
                        print("Spin the reels")
                    }, label: {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                            
                    })
                }
                .layoutPriority(2)
                
                // Footer
                
                Spacer()
                
                HStack {
                    // Bet 20
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {
                            print("Bet 20 coins")
                        }, label: {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .modifier(BetNumberModifier())
                        })
                            .modifier(BetCapsuleModifier())
                            
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(0)
                            .modifier(CasinoChipsModifier())
                    }
                    
                    // Bet 20
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(1)
                            .modifier(CasinoChipsModifier())
                        
                        Button(action: {
                            print("Bet 10 coins")
                        }, label: {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(.yellow)
                                .modifier(BetNumberModifier())
                        })
                            .modifier(BetCapsuleModifier())
                            
                        
                        
                    }
                }
            }
            
            // Buttons
            .overlay(
                // Reset
                Button(action: {
                    print("Reset the game")
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                })
                    .modifier(ButtonModifier()),
                alignment: .topLeading
            )
            
            .overlay(
                // Info
                Button(action: {
                    print("Info View")
                }, label: {
                    Image(systemName: "info.circle")
                })
                    .modifier(ButtonModifier()),
                alignment: .topTrailing
            )
            
            .padding()
            .frame(maxWidth: 720)
        }//: ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}