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
            }
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(wordsearch: WordSearch())
    }
}
