//
//  Bindable.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import Foundation

class Bindable<T> {
    
    init(value: T) {
        self.value = value
    }
    
    var value: T {
        didSet {
            observers.forEach { observe in
                observe(value)
            }
        }
    }
    
    fileprivate var observers: [((T) -> ())] = []
    
    func bind(observer: @escaping(T) ->()) {
        self.observers.append(observer)
    }
}
