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
func isEven (n: Int) -> Bool { return (n % 2) == 0 }

[0,1,2,3,4,5].any
[1,2,3].addFirst(0)
[0,1,2].addLast(3)
[0,1,2,3,4,5,6,7].by(3)
[0,1,2,3].concat([4,5,6])
[0,1,4,5,6,8,9].countIf(isEven)
[0,1,2,3,4,5,6].drop(3)
[0,1,2,3,4,5,6].element(3)
[0,2,4,6].every(isEven)
[0,2,3,6].every(isEven)
[0,1,2,3,4,5].filter(isEven) // built-in for Array
[1,3,5].filter(isEven) // built-in for Array
[0,1,2,3,4].head
let foo: [Int] = []
foo.indexes
["A","B","C","D","E"].indexes
let bar: [Int] = []
bar.isEmpty
[0,1].isEmpty
[0,1,2,3,4,5,6].subseq(from: 2, below: 5)
[0,1,2,3,4].tail

// Strings
func isEqualToC (ch: Character) -> Bool { return (ch == Character("C")) }

"ABCDEFG".any
"BCD".addFirst("A")
"ABC".addLast("D")
"ABCDEFGHIJKL".by(5)
"ABC".concat("DEF")
"ABCCCDEF".countIf(isEqualToC)
"ABCDEF".drop(3)
"ABCDEF".element(3)
"CCCCC".every(isEqualToC)
"CCBCC".every(isEqualToC)
"ABCCDEF".filter(isEqualToC)
"ABCDEF".head
"".indexes
"ABCDEF".indexes
"".isEmpty // built in for String
"ABC".isEmpty // built in for String
"ABCDEFGHIJKLMNOP".subseq(from: 2, below: 5)
"ABCDEF".tail

