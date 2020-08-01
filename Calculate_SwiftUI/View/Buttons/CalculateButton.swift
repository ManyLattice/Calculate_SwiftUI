//
//  CalculateButton.swift
//  Calculate_SwiftUI
//
//  Created by Михаил Гудзикевич on 7/28/20.
//  Copyright © 2020 Михаил Гудзикевич. All rights reserved.
//

import SwiftUI

struct CalculateButton: View {
    
    var value: String = "0"
    var color: Color = Color(#colorLiteral(red: 0.1953498125, green: 0.2001108527, blue: 0.204348743, alpha: 1))
    var width: CGFloat = 80
    var tapHandler: ((String) -> Void)
    
    var body: some View {
        
        Group {
            Button(action: {
                self.tapHandler(self.value)
            }) {
                Text(value)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: self.width, height: 80, alignment: .center)
                    .background(self.color)
                    .cornerRadius(40)
            }
        }
        
        
    }
    
}

struct CalculateButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            CalculateButton { (number) in
                print(number)
            }
        }
    }
}
