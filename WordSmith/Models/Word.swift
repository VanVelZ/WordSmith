//
//  Word.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 6/30/20.
//  Copyright © 2020 Zach Vandervelden. All rights reserved.
//

import Foundation

struct Word{
    let Text:String = "cat"
    var coords:[(X:Int,Y:Int)]{return SetPosition()}
    var Length:Int{return Text.count}
    var orientation = GetOrientation()
    
    
    func SetPosition()->[(Int, Int)]{
        var c:[(x:Int, y:Int)] = []
        switch orientation{
        case .Down:
            //StartingY = rand.Next(0, Settings.BoardY)
            //StartingX = rand.Next(0, Settings.BoardX - Wrd.Length)
            c.append((Int.random(in: 0...Settings.X - Length), Int.random(in: 0...Settings.Y)))
            for i in 1..<Length{
                c.append((c[i].x + 1, c[i].y))
            }
            return c
        case .Right:
            //StartingY = rand.Next(0, Settings.BoardY - Wrd.Length)
            //StartingX = rand.Next(0, Settings.BoardX)
            c.append((Int.random(in: 0...Settings.X), Int.random(in: 0...Settings.Y - Length)))
            for i in 1..<Length{
                c.append((c[i].x, c[i].y + 1))
            }
            return c
        case .Left:
            //StartingY = rand.Next(Wrd.Length, Settings.BoardY)
            //StartingX = rand.Next(0, Settings.BoardX)
            c.append((Int.random(in: 0...Settings.X), Int.random(in: Length...Settings.Y)))
            for i in 1..<Length{
                c.append((c[i].x, c[i].y - 1))
            }
            return c
        case .Up:
            //StartingY = rand.Next(0, Settings.BoardY)
            //StartingX = rand.Next(Wrd.Length, Settings.BoardX - Wrd.Length)
            c.append((Int.random(in: Length...Settings.X), Int.random(in: 0...Settings.Y)))
            for i in 1..<Length{
                c.append((c[i].x - 1, c[i].y))
            }
            return c
        case .UpRight:
            c.append((Int.random(in: Length...Settings.X), Int.random(in: Length...Settings.Y)))
            for i in 1..<Length{
                c.append((c[i].x - 1, c[i].y + 1))
            }
            return c
        case .UpLeft:
            c.append((Int.random(in: Length...Settings.X), Int.random(in: Length...Settings.Y)))
            for i in 1..<Length{
                c.append((c[i].x - 1, c[i].y - 1))
            }
            return c
        case .DownRight:
            c.append((Int.random(in: 0...Settings.X-Length), Int.random(in: 0...Settings.Y - Length)))
            for i in 1..<Length{
                c.append((c[i].x + 1, c[i].y + 1))
            }
            return c
        case .DownLeft:
            c.append((Int.random(in: 0...Settings.X-Length), Int.random(in: Length...Settings.Y)))
            for i in 1..<Length{
                c.append((c[i].x + 1, c[i].y - 1))
            }
            return c
        }
        
    }
     static func GetOrientation()->Orientation{
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
}


