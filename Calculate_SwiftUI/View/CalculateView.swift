//
//  CalculateView.swift
//  Calculate_SwiftUI
//
//  Created by Михаил Гудзикевич on 7/28/20.
//  Copyright © 2020 Михаил Гудзикевич. All rights reserved.
//

import SwiftUI

struct CalculateView: View {
    
    var color: Color = Color(#colorLiteral(red: 0.1953498125, green: 0.2001108527, blue: 0.204348743, alpha: 1))
    var countButton: Int = 3
    
    var body: some View {
        HStack() {
            ForEach(0..<self.countButton) { number in
                CalculateButton(value: String(number), color: self.color) { (number) in
                    print(number)
                }
            }
            CalculateButton(value: "+",color: .orange) { (number) in
                print(number)
            }
        }
        
    }
}

struct CalculateView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                CalculateView()
            }
            .previewDevice("iPhone X")
            
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                CalculateView()
            }
            .previewDevice("iPhone 8")
        }
    }
}
