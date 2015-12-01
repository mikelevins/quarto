//: Playground - noun: a place where people can play

import Foundation

class Indexes: GeneratorType {
    var element: Int
    var interval: Int
    var limit: Int
    
    init<T>(of:[T], by: Int = 1){
        self.element = 0
        self.interval = by
        self.limit = of.count
    }
    
    init(of:String, by: Int = 1){
        self.element = 0
        self.interval = by
        self.limit = of.characters.count
    }
    
    func next() -> Int? {
        self.element += self.interval
        if (self.element < self.limit) {
            return self.element
        } else {
            return nil
        }
    }
}

let indexes1 = Indexes(of: "ABCDEFGHIJ", by: 3)
indexes1.next()
indexes1.next()
indexes1.next()
indexes1.next()

let indexes2 = Indexes(of: [0,1,2,3,4], by: 2)
indexes2.next()
indexes2.next()
indexes2.next()

extension String {
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
    
    func concat (str: String) -> String {
        return self + str
    }
    
}

"ABCDEFG".any
"BCD".addFirst("A")
"ABC".addLast("D")
"ABC".concat("DEF")

extension Array {
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
    
    func concat (things: Array) -> Array {
        return self + things
    }
}

[0,1,2,3,4,5].any
[1,2,3].addFirst(0)
[0,1,2].addLast(3)
[0,1,2,3].concat([4,5,6])

