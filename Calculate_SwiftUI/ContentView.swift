//
//  ContentView.swift
//  Calculate_SwiftUI
//
//  Created by Михаил Гудзикевич on 7/28/20.
//  Copyright © 2020 Михаил Гудзикевич. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let buttons: [Int: [String]] = [
        0: ["AC", "+/-", "%", "÷"],
        1: ["7", "8", "9", "X"],
        3: ["4", "5", "6", "-"],
        4: ["1", "2", "3", "+"],
        5: ["0", ",", "="]
    ]
    
    @EnvironmentObject var display: CalculateDisplayObservable
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                
                HStack {
                    Spacer()
                    Text("\(self.display.sum)")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding(.horizontal)
                        .frame(width: nil)
                        .font(Font.largeTitle)
                }.padding()
                
                ForEach(buttons.keys.sorted(), id: \.self) { key in
                    CalculateView(countButton: self.buttons[key]!.count - 1, value: self.buttons[key]!)
                }
                
                
            }
            .padding(.vertical)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                ContentView().environmentObject(CalculateDisplayObservable())
            }
            .previewDevice("iPhone X")
            
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                ContentView().environmentObject(CalculateDisplayObservable())
            }
            .previewDevice("iPhone 8")
        }
    }
}
