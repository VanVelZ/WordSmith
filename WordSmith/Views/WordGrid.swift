//
//  WordGrid.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 7/28/20.
//  Copyright © 2020 Zach Vandervelden. All rights reserved.
//

import SwiftUI

struct WordGrid: View {
    let wordsearch:WordSearch
    var color:Color = .white
    
    @State private var gestureStart:CGPoint = CGPoint.zero
    @State private var gestureCurrent:CGPoint = CGPoint.zero
    @State private var gestureEndt:CGPoint = CGPoint.zero
    
    var menuDrag : some Gesture{
        DragGesture()
            .onChanged({ value in
                gestureStart = value.startLocation
                gestureCurrent = value.location
                
                
        })
    }
    
    var letters:[Letter]{
        var l:[Letter] = []
        
        var lLocation = CGPoint(x: -160, y: -150)
        for row in 0..<Settings.X{
            for column in 0..<Settings.Y{
                l.append(Letter(Char: self.wordsearch.Board[row][column].Letter, location: lLocation, WordID: self.wordsearch.Board[row][column].WordID))
                lLocation.y = lLocation.y + 40;
            }
            lLocation.y = -150
            lLocation.x = lLocation.x + 40
        }
        return l
    }
    
    var body: some View {
        ZStack{
            menu()
                
        ForEach(letters){ letter in
            letter
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    }
}

struct WordGrid_Previews: PreviewProvider {
    static var previews: some View {
        WordGrid(wordsearch: WordSearch())
    }
}
