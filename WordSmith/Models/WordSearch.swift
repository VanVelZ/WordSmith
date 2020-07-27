//
//  WordSearch.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 6/30/20.
//  Copyright © 2020 Zach Vandervelden. All rights reserved.
//

import Foundation





struct WordSearch{
    var Board: [[(Letter:Character, WordID:Int)]] = [[]]
    
    init(){
        SetupBoardArray()
        SetupTempData()
        AddWordsToBoard()
    }
    
    
    mutating func SetupBoardArray(){
        
        Board.removeAll()
        var row:[(Character,Int)] = []
        for _ in 0..<Settings.X{
            row.removeAll()
            for _  in 0..<Settings.Y{
                row.append((RandomLetterTemp(), 0))
            }
            Board.append(row)
        }
    }
    mutating func SetupBoardArrayTest(){
        
        Board.removeAll()
        var row:[(Character, Int)] = []
        for _ in 0..<Settings.X{
            row.removeAll()
            for _  in 0..<Settings.Y{
                row.append(("+", 0))
            }
            Board.append(row)
        }
    }
    mutating func AddWordsToBoard(){
        
        for word in Settings.Words{
            var i = 0
            for letter in word.Letters{
                Board[word.coords![i].X][word.coords![i].Y] = (letter, word.id)
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
        Settings.Words.append(Word(word: "BABY"))
        Settings.Words.append(Word(word: "CHALK"))
        Settings.Words.append(Word(word: "TACO"))
        Settings.Words.append(Word(word: "LITTLE"))
        Settings.Words.append(Word(word: "STARVE"))
        Settings.Words.append(Word(word: "GENIUS"))
        Settings.Words.append(Word(word: "COCOA"))
        Settings.Words.append(Word(word: "ARGUE"))
        Settings.Words.append(Word(word: "LEFT"))
        Settings.Words.append(Word(word: "FISH"))
        Settings.Words.append(Word(word: "JUMP"))
        Settings.Words.append(Word(word: "BACON"))
    }
    
}

