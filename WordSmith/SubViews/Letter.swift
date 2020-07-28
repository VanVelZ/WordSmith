//
//  Letter.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 7/27/20.
//  Copyright © 2020 Zach Vandervelden. All rights reserved.
//

import Foundation
import SwiftUI

struct Letter:View{
    let Char:Character
    var BGColor:Color{
        
        //there most be a better way to go about assigning random colors
        
        switch WordID{
        case 1:
            return .white
        case 2:
            return .red
        case 3:
            return .blue
        case 4:
            return .yellow
        case 5:
            return .orange
        case 6:
            return .purple
        case 7:
            return .pink
        case 8:
            return .green
        case 9:
            return .red
        case 10:
            return .blue
        case 11:
            return .yellow
        case 12:
            return .orange
        case 13:
            return .purple
        case 14:
            return .pink
        case 15:
            return .green
        default:
            return .white
        }
    }
    var RootWord:Word?{
        for word in Settings.Words{
            if word.id == WordID{return word}
        }
        return nil
    }
    let WordID:Int
    @State var didSelect:Bool = false
    
    var body: some View {
        ZStack{
            Text(String(Char).capitalized)
                .font(Font.custom("Courier New", size: 15.0))
                .fontWeight(.bold)
                .foregroundColor(Color.black)
        }
        .frame(width: 25, height: 25)
    }
    
}
