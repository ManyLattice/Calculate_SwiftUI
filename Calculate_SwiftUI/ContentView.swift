//
//  ContentView.swift
//  Calculate_SwiftUI
//
//  Created by Михаил Гудзикевич on 7/28/20.
//  Copyright © 2020 Михаил Гудзикевич. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 12) {
                HStack {
                    Spacer()
                    Text("0")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding(.horizontal)
                        .frame(width: nil)
                        .font(Font.largeTitle)
                }.padding()
                
                ForEach(0..<4) { _ in
                    CalculateView()
                }
                .padding(.horizontal)
                CalculateView(countButton: 2)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
