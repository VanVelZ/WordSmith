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
            WordGrid(wordsearch: wordsearch)
            ForEach(Settings.Words, id: \.id) { word in
                Text("\(word.id): \(word.Text!)")
                }
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
    var body: some View {
        HStack {
            ForEach(0..<Settings.X, id: \.self) { column in
                VStack {
                    ForEach(0..<Settings.Y, id: \.self){ row in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(.white)
                                .frame(width: 21, height: 15, alignment: .bottom)
                            Text(String(self.wordsearch.Board[row][column].Letter).capitalized)
                                .font(Font.custom("Courier New", size: 15.0))
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                        }
                    }
                }
            }
        }
    }
}
