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
    var tapHandler: ((Int) -> Void)
    
    var body: some View {
        
        Group {
            Button(action: {
                guard let value = Int(self.value) else { return }
                self.tapHandler(value)
            }) {
                Text(value)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 80, height: 80, alignment: .center)
        }
        .background(color)
        .clipShape(Circle())        
        
        
    }
}

struct CalculateButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculateButton { (number) in
            print(number)
        }
    }
}
