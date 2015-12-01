//
//  ArrayExtensions.swift
//  
//
//  Created by mikel evins on 12/1/15.
//
//

import Foundation

public extension Array {
    var any : Element {
        let count = self.count
        let index = self.startIndex.advancedBy(Int(arc4random_uniform(UInt32(count))))
        return self[index]
    }
    
    func addFirst (thing: Element) -> [Element] {
        return [thing] + self
    }
    
    func addLast (thing: Element) -> [Element] {
        return self + [thing]
    }
    
    func by (count: Int) -> [[Element]] {
        let limit = self.count
        var result: [[Element]] = []
        if (count <= limit) {
            result = [self.subseq(from: 0, below: count)]
            let indexes = Indexes(of: self, by: count)
            while let i = indexes.next() {
                if ((i+count)<limit) {
                    result = result + [self.subseq(from: i, below: i+count)]
                } else {
                    result = result + [self.subseq(from: i, below: limit)]
                }
            }
        } else {
            result = [self]
        }
        return result
    }
    
    func concat (things: Array) -> Array {
        return self + things
    }
    
    func countIf(test: Element -> Bool) -> Int {
        var sum: Int = 0
        for elt in self {
            if test(elt) {sum++}
        }
        return sum
    }
    
    var head : Element {
        return self[0]
    }
    
    func subseq (from from: Int, below: Int) -> [Element] {
        return Array(self[from..<below])
    }
    
    var tail : [Element] {
        return Array(self[1..<count])
    }
}
