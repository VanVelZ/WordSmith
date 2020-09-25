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
    @State private var gestureEnd:CGPoint = CGPoint.zero
    @State private var selectedLetters:[Letter] = []
    @State private var foundLetters:[Letter] = []
    
    var selectDrag : some Gesture{
        DragGesture()
            .onChanged({ value in
                gestureCurrent = value.location
                
                CheckForLetter(position: gestureCurrent)
            }).onEnded({value in
                isWordSelected()
                selectedLetters.removeAll()
            })
    }
    func isWordSelected(){
        let selectId = selectedLetters[1].WordID
        
        for word in Settings.Words{
            if word.id == selectId{
                for letter in selectedLetters{
                    if(letter.WordID != word.id){
                        foundLetters.removeAll()
                        return
                    }
                    else{
                        foundLetters.append(Letter(Char: letter.Char, location: letter.location, letterVisibility: .found, WordID: letter.WordID))
                    }
                }
            }
        }
        
    }
    func CheckForLetter(position:CGPoint){
        for letter in letters {
            let topleft = CGPoint(x: letter.location.x - 20, y: letter.location.y - 20)
            let bottomright = CGPoint(x: letter.location.x + 20, y: letter.location.y + 20)
            if(gestureCurrent.x > topleft.x &&
                gestureCurrent.x < bottomright.x &&
                gestureCurrent.y > topleft.y &&
                gestureCurrent.y < bottomright.y){
                selectedLetters.append(Letter(Char: letter.Char, location: letter.location, letterVisibility: .selected, WordID: letter.WordID))
            }
        }
        
    }
    
    
    var letters:[Letter]{
        var l:[Letter] = []
        
        var lLocation = CGPoint(x: -160, y: -150)
        for row in 0..<Settings.X{
            for column in 0..<Settings.Y{
                l.append(Letter(Char: self.wordsearch.Board[row][column].Letter, location: lLocation, letterVisibility: .hidden, WordID: self.wordsearch.Board[row][column].WordID))
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
            ZStack{
                ForEach(letters){ letter in
                    letter
                }
            }.gesture(selectDrag)
            ForEach(selectedLetters){ letter in
                letter
            }
            ForEach(foundLetters){ letter in
                letter
            }
            Text("\(gestureCurrent.x), \(gestureCurrent.y)")
                .position(CGPoint(x: 200, y: 0))
        }.gesture(selectDrag)
    }
}

struct WordGrid_Previews: PreviewProvider {
    static var previews: some View {
        WordGrid(wordsearch: WordSearch())
    }
}