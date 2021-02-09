//
//  WordSearch.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 6/30/20.
//  Copyright © 2020 Zach Vandervelden. All rights reserved.
//

import Foundation




class WordSearch{
    private(set) var board: [[Character]] = [[]]
    private(set) var settings: Settings = Settings()
    
    func SetupBoardArray(){
        
        board.removeAll()
        var row:[Character] = []
        for _ in 0..<settings.size.x{
            row.removeAll()
            for _  in 0..<settings.size.y{
                row.append(RandomLetterTemp())
            }
            board.append(row)
        }
    }
    func SetupBoardArrayTest(){
        
        board.removeAll()
        var row:[Character] = []
        for _ in 0..<settings.size.x{
            row.removeAll()
            for _  in 0..<settings.size.y{
                row.append("+")
            }
            board.append(row)
        }
    }
    func AddWordsToBoard(){
        
        for word in settings.Words{
            var i = 0
            for letter in word.text{
                board[word.coords![i].X][word.coords![i].Y] = letter
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
        
        for row in board{
            for letter in row{
                text += "\(letter.lowercased())  "
            }
            text+="\n\n"
        }
        return text
        
    }
    
}

