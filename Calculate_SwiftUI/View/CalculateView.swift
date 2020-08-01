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
    
    @State private var isShowAlert: Bool = false
    
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
            .alert(isPresented: $isShowAlert) { () -> Alert in
                Alert(title: Text("Как ты это сделал?"), dismissButton: .default(Text("Ok")) {
                    self.isShowAlert = false
                    })
            }
        }
        
    }
    
    private func getWidthButton(_ number: Int) -> CGFloat {
        guard value.indices.contains(number) else { return 80 }
        return value[number] == "0" ? 80 * 2 : 80
    }
    
    private func setDisplaySum(_ value: String) {
        if let _ = Int(value) {
            self.display.sum += value
        }else {
            switch value {
            case "+", "-", "X", "÷", "AC":
                self.display.operation = value
                self.display.templateSum = self.display.sum
                self.display.sum = "0"
            case "+/-":
                guard let sum = Int(self.display.sum) else { return }
                self.display.sum = "\(-sum)"
            case "=":
                operation()
            default:
                isShowAlert = true
            }
        }
    }
    
    private func operation() {
        var operationSum: Int?
        
        guard let templateSum = Int(self.display.templateSum), let sum = Int(self.display.sum) else { return }
        switch self.display.operation {
        case "+":
            operationSum = templateSum + sum
        case "-":
            operationSum = templateSum - sum
        case "X":
            operationSum = templateSum * sum
        case "÷":
            operationSum = templateSum / sum
        case "+/-":
            operationSum = -sum
        case "AC":
            self.display.templateSum.removeAll()
            self.display.sum = "0"
        default:
            isShowAlert = true
        }
        
        guard operationSum != nil else { return }
        self.display.sum = "\(operationSum!)"
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
