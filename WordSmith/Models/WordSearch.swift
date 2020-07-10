//
//  WordSearch.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 6/30/20.
//  Copyright © 2020 Zach Vandervelden. All rights reserved.
//

import Foundation

struct WordSearch{
    var Board: [[Character]] = [[]]
    
    init(){
        SetupBoardArray()
        SetupTempData()
        AddWordsToBoard()
    }
    
    
    mutating func SetupBoardArray(){
        
        Board.removeAll()
        var row:[Character] = []
        for _ in 0..<Settings.X{
            row.removeAll()
            for _  in 0..<Settings.Y{
                row.append(RandomLetterTemp())
            }
            Board.append(row)
        }
    }
    mutating func AddWordsToBoard(){
        
        for word in Settings.Words{
            var i = 0
            for letter in word.Letters{
                Board[word.coords![i].X][word.coords![i].Y] = letter
                i+=1
            }
        }
    }
    
    let chars:[Character] = ["a","b","c","d","e","f","g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    func RandomLetterTemp() ->  Character{
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
    
    func SetupTempData(){
        Settings.Words.append(Word(word: "baby"))
        Settings.Words.append(Word(word: "chalk"))
        Settings.Words.append(Word(word: "taco"))
        Settings.Words.append(Word(word: "little"))
    }
}

