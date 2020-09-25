//
//  Letter.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 7/27/20.
//  Copyright © 2020 Zach Vandervelden. All rights reserved.
//

import Foundation
import SwiftUI

enum Visibility {
    case hidden
    case selected
    case found
}


struct Letter:View, Identifiable{
    var id = UUID()
    
    let Char:Character
    let location:CGPoint
    let letterVisibility:Visibility
    var BGColor:Color {
        switch(letterVisibility){
        case .found:
            return .blue
        case .hidden:
            return .black
        case .selected:
            return .gray
        }
    }
    
    var RootWord:Word?{
        for word in Settings.Words{
            if word.id == WordID{return word}
        }
        return nil
    }
    let WordID:Int
    
    
    
    var body: some View {
        ZStack{
            Text(String(Char).capitalized)
                .font(Font.custom("Courier New", size: 23.0))
                .fontWeight(.bold)
                .foregroundColor(BGColor)
                .position(location)
                .frame(width: 40, height: 40, alignment: .center)
        }
    }
    
}
