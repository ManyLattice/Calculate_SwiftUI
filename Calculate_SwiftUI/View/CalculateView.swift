//
//  CalculateView.swift
//  Calculate_SwiftUI
//
//  Created by Михаил Гудзикевич on 7/28/20.
//  Copyright © 2020 Михаил Гудзикевич. All rights reserved.
//

import SwiftUI

struct CalculateView: View {
    
    @EnvironmentObject var display: CalculateDisplayObservable
    
    var color: Color = Color(#colorLiteral(red: 0.1953498125, green: 0.2001108527, blue: 0.204348743, alpha: 1))
    var countButton: Int = 3
    var value = ["1", "2", "3", "+"]
    
    var body: some View {
        HStack() {
            ForEach(0..<self.countButton) { number in
                CalculateButton(value: self.value[number], color: self.color, width: self.getWidthButton(number)) { (value) in
                    self.setDisplaySum(value)
                }
            }
            CalculateButton(value: value.last!,color: .orange) { (value) in
                self.setDisplaySum(value)
            }
        }
        
    }
    
    private func getWidthButton(_ number: Int) -> CGFloat {
        guard value.indices.contains(number) else { return 80 }
        return value[number] == "0" ? 80 * 2 : 80
    }
    
    private func setDisplaySum(_ value: String) {
        guard let value = Int(value) else { return }
        self.display.sum = value
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
