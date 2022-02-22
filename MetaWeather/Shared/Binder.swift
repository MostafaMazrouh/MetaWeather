//
//  Binder.swift
//  MetaWeather
//
//  Created by Mostafa Mahmoud on 19/02/2022.
//

import Foundation

class Binder<T> {
    
    typealias Listener = (T?) -> Void
    var listener: Listener?
    
    // Generic value
    var value: T? { didSet { listener?(value) } }
    
    init(_ value: T?) { self.value = value }
    
    
    // Call this method to bind a value to a closure
    // The closure will be called every time the value changes
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
