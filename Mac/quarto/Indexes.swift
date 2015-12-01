//
//  Indexes.swift
//  
//
//  Created by mikel evins on 12/1/15.
//
//

import Foundation

public class Indexes: GeneratorType {
    var element: Int
    var interval: Int
    var limit: Int
    
    public init<T>(of:[T], by: Int = 1){
        self.element = 0
        self.interval = by
        self.limit = of.count
    }
    
    public init(of:String, by: Int = 1){
        self.element = 0
        self.interval = by
        self.limit = of.characters.count
    }
    
    public func next() -> Int? {
        self.element += self.interval
        if (self.element < self.limit) {
            return self.element
        } else {
            return nil
        }
    }
}

