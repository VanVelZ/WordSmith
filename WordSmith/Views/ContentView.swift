//
//  ContentView.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 6/30/20.
//  Copyright © 2020 Zach Vandervelden. All rights reserved.
//

import SwiftUI
import Foundation

struct ContentView: View {
    var wordsearch = WordSearch()
    var body: some View {
        VStack {
            ZStack{
            WordGrid(wordsearch: wordsearch)
            }.frame(width: 60, height: 200)
                .padding(.bottom)
            ForEach(Settings.Words, id: \.id) { word in
                Text("\(word.id): \(word.Text!)")
            }.padding(.top)
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct WordGrid: View {
    let wordsearch:WordSearch
    var color:Color = .white
    
    
    var body: some View {
        HStack {
            ForEach(0..<Settings.X, id: \.self) { column in
                VStack {
                    ForEach(0..<Settings.Y, id: \.self){ row in
                        HStack{
                            Letter(Char: self.wordsearch.Board[row][column].Letter, WordID: self.wordsearch.Board[row][column].WordID)
                        }
                    }
                }
            }
        }
    }
    
}
