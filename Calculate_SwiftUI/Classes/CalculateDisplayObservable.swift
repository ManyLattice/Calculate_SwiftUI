//
//  CalculateDisplayObservable.swift
//  Calculate_SwiftUI
//
//  Created by Михаил Гудзикевич on 8/1/20.
//  Copyright © 2020 Михаил Гудзикевич. All rights reserved.
//

import Foundation
import SwiftUI

class CalculateDisplayObservable: ObservableObject {
    
    @Published var sum = "0" {
        didSet {
            if sum.count > 1 && sum.first == "0" && !sum.contains(",") {
                sum.removeFirst()
            }
        }
    }
    
    @Published var templateSum: String = ""
    
    @Published var operation: String = ""
    
}
