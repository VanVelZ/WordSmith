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
    @State private var wordsearch = WordSearch()
    init() {
        wordsearch.SetupBoardArray()
    }
    var body: some View {
        Text(wordsearch.Display)
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
