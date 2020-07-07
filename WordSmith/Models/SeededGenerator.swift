//
//  SeededGenerator.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 7/1/20.
//  Copyright © 2020 Zach Vandervelden. All rights reserved.
//

import Foundation
import GameplayKit

///https://stackoverflow.com/questions/54821659/swift-4-2-seeding-a-random-number-generator
// Make a random seed and store in a database
var seed:UInt64{
    return UInt64.random(in: UInt64.min ... UInt64.max)
}
 var generator:SeededGenerator{
    return SeededGenerator(seed: seed)
}
// Or if you just need the seeding ability for testing,
// var generator = Generator()
// uses a default seed of 0
class SeededGenerator: RandomNumberGenerator {
    let seed: UInt64
    private let generator: GKMersenneTwisterRandomSource
    convenience init() {
        self.init(seed: 0)
    }
    init(seed: UInt64) {
        self.seed = seed
        generator = GKMersenneTwisterRandomSource(seed: seed)
    }
    func next<T>(upperBound: T) -> T where T : FixedWidthInteger, T : UnsignedInteger {
        return T(abs(generator.nextInt(upperBound: Int(upperBound))))
    }
    func next<T>() -> T where T : FixedWidthInteger, T : UnsignedInteger {
        return T(abs(generator.nextInt()))
    }

    // etc.
    func GetRandomLetter()->String{
        // Make a random seed and store in a database
        let seed = UInt64.random(in: UInt64.min ... UInt64.max)
        var gen = SeededGenerator(seed: seed)
        // Or if you just need the seeding ability for testing,
        // var generator = Generator()
        // uses a default seed of 0
        let chars = ["a","b","c","d","e","f","g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        return chars.randomElement(using: &gen)!
        
    }
}
