//
//  WordSearch.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 6/30/20.
//  Copyright © 2020 Zach Vandervelden. All rights reserved.
//

import Foundation

struct WordSearch{
    
    let X: Int = 12
    let Y: Int  = 12
    var Board: [[String]] = [[]]
    
    init(){
        SetupBoardArray()
    }
    
    
    mutating func SetupBoardArray(){
        
        Board.removeAll()
        var row:[String] = []
        for _ in 0..<Settings.X{
            row.removeAll()
            for _  in 0..<Settings.Y{
                row.append(RandomLetterTemp())
            }
            Board.append(row)
        }
    }
    
    
    let chars = ["a","b","c","d","e","f","g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    func RandomLetterTemp() ->  String{
        return chars[Int.random(in: 0...chars.count-1)]
    }
    
    
    
    
    var Display: String {
        var text:String = ""
        
        for row in Board{
            for letter in row{
                text += "\(letter)  "
            }
            text+="\n\n"
        }
        return text
        
    }
    
}

