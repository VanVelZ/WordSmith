//
//  Word.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 6/30/20.
//  Copyright © 2020 Zach Vandervelden. All rights reserved.
//

import Foundation




struct Word:Identifiable{
    
    
    var id:Int = 1
    var Text:String?
    var Letters:[Character] {
        var letters:[Character] = []
        for letter in Text!{
            letters.append(letter)
        }
        return letters
    }
    var coords:[(X:Int,Y:Int)]?
    var Length:Int{return Text!.count}
    var orientation:Orientation?
    
    init(word:String){
        Text = word
        GetID()
        orientation = SetOrientation()
        coords = SetPosition()
        
    }
    mutating func GetID(){
        for word in Settings.Words{
            if word.id >= id{
                id = word.id + 1
            }
        }
    }
    func SetPosition()->[(Int, Int)]{
        var c:[(x:Int, y:Int)] = []
        switch orientation{
        case .Down:
            //StartingY = rand.Next(0, Settings.BoardY)
            //StartingX = rand.Next(0, Settings.BoardX - Wrd.Length)
            c.append((Int.random(in: 0..<Settings.X - Length), Int.random(in: 0..<Settings.Y)))
            for i in 0..<Length-1{
                c.append((c[i].x + 1, c[i].y))
            }
        case .Right:
            //StartingY = rand.Next(0, Settings.BoardY - Wrd.Length)
            //StartingX = rand.Next(0, Settings.BoardX)
            c.append((Int.random(in: 0..<Settings.X), Int.random(in: 0..<Settings.Y - Length)))
            for i in 0..<Length-1{
                c.append((c[i].x, c[i].y + 1))
            }
        case .Left:
            //StartingY = rand.Next(Wrd.Length, Settings.BoardY)
            //StartingX = rand.Next(0, Settings.BoardX)
            c.append((Int.random(in: 0..<Settings.X), Int.random(in: Length..<Settings.Y)))
            for i in 0..<Length-1{
                c.append((c[i].x, c[i].y - 1))
            }
        case .Up:
            //StartingY = rand.Next(0, Settings.BoardY)
            //StartingX = rand.Next(Wrd.Length, Settings.BoardX - Wrd.Length)
            c.append((Int.random(in: Length..<Settings.X), Int.random(in: 0..<Settings.Y)))
            for i in 0..<Length-1{
                c.append((c[i].x - 1, c[i].y))
            }
        case .UpRight:
            c.append((Int.random(in: 0..<Settings.X-Length), Int.random(in: Length..<Settings.Y)))
            for i in 0..<Length-1{
                c.append((c[i].x + 1, c[i].y - 1))
            }
        case .UpLeft:
            c.append((Int.random(in: Length..<Settings.X), Int.random(in: Length..<Settings.Y)))
            for i in 0..<Length-1{
                c.append((c[i].x - 1, c[i].y - 1))
            }
        case .DownRight:
            c.append((Int.random(in: 0..<Settings.X-Length), Int.random(in: 0..<Settings.Y - Length)))
            for i in 0..<Length-1{
                c.append((c[i].x + 1, c[i].y + 1))
            }
        case .DownLeft:
            c.append((Int.random(in: Length..<Settings.X), Int.random(in: 0..<Settings.Y-Length)))
            for i in 0..<Length-1{
                c.append((c[i].x - 1, c[i].y + 1))
            }
        case .none:
            return SetPosition()
        }
        if areValidSpots(coos: c){ return c}
        else{return SetPosition()}
        
    }
    func SetPosition(startingCoords:(Int,Int))->[(Int, Int)]{
        var c:[(x:Int, y:Int)] = [startingCoords]
        switch orientation{
        case .Down:
            for i in 1..<Length{
                c.append((c[i].x + 1, c[i].y))
            }
        case .Right:
            for i in 1..<Length{
                c.append((c[i].x, c[i].y + 1))
            }
        case .Left:
            for i in 1..<Length{
                c.append((c[i].x, c[i].y - 1))
            }
        case .Up:
            for i in 1..<Length{
                c.append((c[i].x - 1, c[i].y))
            }
        case .UpRight:
            for i in 1..<Length{
                c.append((c[i].x - 1, c[i].y + 1))
            }
        case .UpLeft:
            for i in 1..<Length{
                c.append((c[i].x - 1, c[i].y - 1))
            }
        case .DownRight:
            for i in 1..<Length{
                c.append((c[i].x + 1, c[i].y + 1))
            }
        case .DownLeft:
            for i in 1..<Length{
                c.append((c[i].x + 1, c[i].y - 1))
            }
        case .none:
            return [(0,0), (1,1),  (2, 2)]
        }
        if areValidSpots(coos: c){ return c}
        else{return SetPosition()}
        
    }
     func SetOrientation()->Orientation{
         let i = Int.random(in: 0...7)
         
         if i == 0{
             return .Right
         }
         else if i == 1{
             return .Down
         }
         else if i == 2{
             return .Left
         }
         else if i == 3{
             return .Up;
         }
         else if i == 4{
             return .DownLeft
         }
         else if i == 5{
             return .DownRight
         }
         else if i == 6{
             return .UpLeft
         }
         else{
             return .UpRight
         }
     }
    
    
    
    
    func areValidSpots()->Bool{
        //Bug
           for co in coords!{
            var i = 0
               for w in Settings.Words{
                   var j = 0
                   for wc in w.coords!{
                    if co == wc && Letters[i] != w.Letters[j]{
                           return false
                       }
                    j+=1
                   }
               }
            i+=1
           }
           return true
    }
    func areValidSpots(coos:[(Int, Int)])->Bool{
        //Bug
           for co in coos{
            var i = 0
               for w in Settings.Words{
                   var j = 0
                   for wc in w.coords!{
                    if co == wc && Letters[i] != w.Letters[j]{
                           return false
                       }
                    j+=1
                   }
               }
            i+=1
           }
           return true
       }
}


