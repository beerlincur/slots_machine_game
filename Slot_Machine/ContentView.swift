//
//  ContentView.swift
//  Slot_Machine
//
//  Created by zhozh on 11.03.2020.
//  Copyright © 2020 zhozh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var icons: [String] = ["beer", "jackpot", "pizza", "sweet"]
    
    @State private var states: [Int] = Array(repeating: 0, count: 9)
    
    @State private var backs: [Color] = Array(repeating: Color.white, count: 9)
    
    @State private var credits: Int = 1000
    
    @State private var reward: String = ""
    
    private var bet: Int = 10
    
    var body: some View {
        
        ZStack
        {
                Rectangle()
                    .foregroundColor(Color(red: 204/255, green: 204/255, blue: 255/255))
                    .edgesIgnoringSafeArea(.all)
                
//                Rectangle()
//                    .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
//                    .rotationEffect(Angle(degrees: 45))
//                    .edgesIgnoringSafeArea(.all)
                
                
                VStack
                    {
                        Spacer()
                        HStack
                            {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                
                                Text("Food machine!")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                
                        }.scaleEffect(2)
                        
                        Spacer()
                        
                        HStack
                        {
                            
                            if reward.contains("+")
                            {
                                Text("\(reward)")
                                    .fontWeight(.heavy)
                                    .padding()
                                    .foregroundColor(Color(red: 0/255, green: 153/255, blue: 51/255))
                                    .scaleEffect(1.5)
                            }
                            else
                            {
                                Text("\(reward)")
                                .fontWeight(.heavy)
                                .padding()
                                    .foregroundColor(Color.red)
                                .scaleEffect(1.5)
                            }
                            
                            Text("Money: " + String(self.credits))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.all, 13)
                                .background(Color(red: 255/255, green: 204/255, blue: 153/255).opacity(0.5))
                                .cornerRadius(30)
                            
                            if reward.contains("+")
                            {
                                Text("\(reward)")
                                    .fontWeight(.heavy)
                                    .padding()
                                    .foregroundColor(Color(red: 0/255, green: 153/255, blue: 51/255))
                                    .scaleEffect(1.5)
                            }
                            else
                            {
                                Text("\(reward)")
                                .fontWeight(.heavy)
                                .padding()
                                    .foregroundColor(Color.red)
                                .scaleEffect(1.5)
                            }
                        }
                        
                        VStack
                        {
                            HStack
                            {
                                Spacer()
                                    
                                CardView(symbol: $icons[states[0]], back: $backs[0])
                                    
                                CardView(symbol: $icons[states[1]], back: $backs[1])
                                
                                CardView(symbol: $icons[states[2]], back: $backs[2])
                                
                                Spacer()
                            }
                            
                            HStack
                            {
                                Spacer()
                                    
                                CardView(symbol: $icons[states[3]], back: $backs[3])
                                    
                                CardView(symbol: $icons[states[4]], back: $backs[4])
                                
                                CardView(symbol: $icons[states[5]], back: $backs[5])
                                
                                Spacer()
                            }
                            
                            HStack
                            {
                                Spacer()
                                    
                                CardView(symbol: $icons[states[6]], back: $backs[6])
                                    
                                CardView(symbol: $icons[states[7]], back: $backs[7])
                                
                                CardView(symbol: $icons[states[8]], back: $backs[8])
                                
                                Spacer()
                            }
                        }
                        
                        Spacer()
                        
                        HStack
                        {
                            Spacer()
                            
                            VStack
                            {
                                Button(
                                    action: {
                                        
                                        if self.credits >= self.bet * 5 { self.processResult(true) }
                                        else
                                        { self.reward = "No money!" }
                                    },
                                    label: {
                                        
                                        Text("Full")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .padding(.all, 10)
                                            .padding([.leading, .trailing], 25)
                                            .background(Color(red: 255/255, green: 102/255, blue: 153/255))
                                            .cornerRadius(20)
                                            .scaleEffect(1.5)
                                    }
                                )
                                
                                Text("\(bet * 5)")
                                    .fontWeight(.heavy)
                                    .padding(.all)
                                    .background(Color(red: 255/255, green: 204/255, blue: 153/255).opacity(0.9))
                                    .cornerRadius(90)
                                    .padding(.top, 20)
                                
                                Text("Spins every single card")
                                .multilineTextAlignment(.center)
                                .lineLimit(3)
                                .opacity(0.5)
                                .padding()
                            }
                            
                            Spacer()
                            
                            VStack
                            {
                                Button(
                                    action: {
                                        
                                        if self.credits >= self.bet { self.processResult() }
                                        else
                                        { self.reward = "No money!" }
                                    },
                                    label: {
                                        
                                        Text("Base")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .padding(.all, 10)
                                            .padding([.leading, .trailing], 25)
                                            .background(Color(red: 255/255, green: 102/255, blue: 153/255))
                                            .cornerRadius(20)
                                            .scaleEffect(1.5)
                                    }
                                )
                                
                                Text("\(bet)")
                                    .fontWeight(.heavy)
                                    .padding(.all)
                                    .background(Color(red: 255/255, green: 204/255, blue: 153/255).opacity(0.9))
                                    .cornerRadius(90)
                                    .padding(.top, 20)
                                
                                Text("Spins three middle cards")
                                    .multilineTextAlignment(.center)
                                    .lineLimit(3)
                                    .opacity(0.5)
                                    .padding()
                            }.edgesIgnoringSafeArea(.all)
                            
                            Spacer()
                        }.edgesIgnoringSafeArea(.all)
                        Spacer()
                }
        }
        
    }
    
    func processResult( _ isMax:Bool = false)
    {
        
        self.backs = self.backs.map ({ _ in Color.white})
        
        if isMax
        {
            self.states = self.states.map ({ _ in Int.random(in: 0...self.icons.count - 1)})
        }
        else
        {
            self.states[3] = Int.random(in: 0...self.icons.count - 1)
            self.states[4] = Int.random(in: 0...self.icons.count - 1)
            self.states[5] = Int.random(in: 0...self.icons.count - 1)
        }

        processWin(isMax)
    }
    
    func processWin( _ isMax:Bool = false)
    {
        var matches = 0
        
        if !isMax
        {
            if isMatch(3, 4, 5) { matches += 1 }
        }
        else
        {
            if isMatch(0, 1, 2) { matches += 1 }
            
            if isMatch(3, 4, 5) { matches += 1 }
            
            if isMatch(6, 7, 8) { matches += 1 }
            
            if isMatch(0, 4, 8) { matches += 1 }
            
            if isMatch(2, 4, 6) { matches += 1 }
        }
        
        if matches > 0
        {
            let winAmount = matches * bet * 2
            self.credits += winAmount
            self.reward = "+\(winAmount)"
        }
        else if !isMax
        {
            self.credits -= bet
            //self.reward = "-\(bet)"
            self.reward = ""
        }
        else
        {
            //let loseAmount = bet * 5
            self.credits -= bet * 5
            self.reward = ""
            //self.reward = "-\(loseAmount)"
        }
        
    }
    
    func isMatch( _ index1:Int, _ index2:Int, _ index3:Int) -> Bool
    {
        if self.states[index1] == self.states[index2] && self.states[index2] == self.states[index3]
        {
            self.backs[index1] = Color.green
            self.backs[index2] = Color.green
            self.backs[index3] = Color.green
            
            return true
        }
        
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
