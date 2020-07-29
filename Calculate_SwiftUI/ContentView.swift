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
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Text("0")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.trailing)
                    .padding(.horizontal)
                    .frame(width: nil)
                    
                ForEach(0..<4) { _ in
                    CalculateView()
                }
                CalculateView(countButton: 2)
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
