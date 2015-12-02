//
//  StringExtensions.swift
//  Quarto
//
//  Created by mikel evins on 12/1/15.
//  Copyright © 2015 mikel evins. All rights reserved.
//

import Foundation

public extension String {
    var any : Character {
        let count = self.characters.count
        let index = self.startIndex.advancedBy(Int(arc4random_uniform(UInt32(count))))
        return self[index]
    }
    
    func addFirst (ch: Character) -> String {
        return String(ch) + self
    }
    
    func addLast (ch: Character) -> String {
        return self + String(ch)
    }
    
    func by (count: Int) -> [String] {
        let limit = self.characters.count
        var result: [String] = []
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
    
    func concat (str: String) -> String {
        return self + str
    }

    func countIf(test: Character -> Bool) -> Int {
        var sum: Int = 0
        for elt in self.characters {
            if test(elt) {sum++}
        }
        return sum
    }
    
    func drop (n: Int) -> String {
        return self.subseq(from: n, below: characters.count)
    }
    
    func element(n: Int) -> Character{
        return self[self.startIndex.advancedBy(n)]
    }

    
    func every (test: Character -> Bool) -> Bool {
        for elt in self.characters {
            if !test(elt) { return false }
        }
        return true
    }
    
    func filter( test: Character -> Bool ) -> String {
        return String (self.characters.filter(test))
    }

    
    func findIf (test: Character -> Bool) -> Character? {
        for elt in self.characters {
            if (test(elt)) {
                return elt
            }
        }
        return nil
    }

    var head : Character {
        return characters[characters.startIndex]
    }
    
    var indexes : [Int] {
        if self.characters.count > 0 {
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
    
    func subseq (from from: Int, below: Int) -> String {
        let range = Range(start: self.startIndex.advancedBy(from),
            end: (self.startIndex.advancedBy(below)))
        return self.substringWithRange(range)
    }
    
    var tail : String {
        return self.subseq(from: 1, below: characters.count)
    }
    
}
