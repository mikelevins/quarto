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
    
    func drop (n: Int) -> [Element] {
        return self.subseq(from: n, below: count)
    }
    
    func element(n: Int) -> Element{
        return self[n]
    }
    
    func every (test: Element -> Bool) -> Bool {
        for elt in self {
            if !test(elt) { return false }
        }
        return true
    }
    
    func findIf (test: Element -> Bool) -> Element? {
        for elt in self {
            if (test(elt)) {
                return elt
            }
        }
        return nil
    }
    
    var head : Element {
        return self[0]
    }
    
    var indexes : [Int] {
        if self.count > 0 {
            let indexgen = Indexes(of: self)
            var result : [Int] = [0]
            while let i = indexgen.next() {
                result += [i]
            }
            return result
        } else {
            return []
        }
    }
    
    var isEmpty : Bool {
        return (self.count == 0)
    }
    
    func leave (n: Int) -> [Element] {
        return self.subseq(from: (count - n), below: count)
    }

    func subseq (from from: Int, below: Int) -> [Element] {
        return Array(self[from..<below])
    }
    
    var tail : [Element] {
        return Array(self[1..<count])
    }
    
    func take (n: Int) -> [Element] {
        return self.subseq(from: 0, below: n)
    }
}
