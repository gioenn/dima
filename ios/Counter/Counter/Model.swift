//
//  Model.swift
//  Counter
//
//  Created by Giovanni Quattrocchi on 15/12/21.
//

import Foundation


class Model: ObservableObject {
    
    @Published var value: Float = 0
    
    func addOne() -> Void {
        if value < 10 {
            value += 1
        }
    }
    
    func subOne() -> Void {
        if value > 0 {
            value -= 1
        }
    }
    
    
}
