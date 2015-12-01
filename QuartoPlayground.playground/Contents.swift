//: Playground - noun: a place where people can play

import Foundation
import Quarto

// Indexes

let indexes1 = Indexes(of: "ABCDEFGHIJ", by: 3)
indexes1.next()
indexes1.next()
indexes1.next()
indexes1.next()

let indexes2 = Indexes(of: [0,1,2,3,4], by: 2)
indexes2.next()
indexes2.next()
indexes2.next()

// Arrays

func isOdd(n: Int) -> Bool {
    let r = n % 2
    return (r != 0)
}

[0,1,2,3,4,5].any
[1,2,3].addFirst(0)
[0,1,2].addLast(3)
[0,1,2,3,4,5,6,7].by(3)
[0,1,2,3].concat([4,5,6])
[0,2,4,5,6,8,9].countIf(isOdd)
[0,1,2,3,4].head
[0,1,2,3,4].tail
[0,1,2,3,4,5,6].subseq(from: 2, below: 5)

// Strings

func isEqualToC (ch: Character) -> Bool { return (ch == Character("C")) }

"ABCDEFG".any
"BCD".addFirst("A")
"ABC".addLast("D")
"ABCDEFGHIJKL".by(5)
"ABC".concat("DEF")
"ABCCCDEF".countIf(isEqualToC)
"ABCDEF".head
"ABCDEF".tail
"ABCDEFGHIJKLMNOP".subseq(from: 2, below: 5)

