//
//  WordCard.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 9/25/20.
//  Copyright © 2020 Zach Vandervelden. All rights reserved.
//

import SwiftUI

enum CardState {
    case small
    case medium
    case large
}

struct WordCard: View {
    
    @State private var menuPosition:CGPoint = CGPoint.zero
    @State private var offset:CGPoint = CGPoint.zero
    let smallPosition = CGPoint(x: 207, y: 100)
    let mediumPosition = CGPoint(x: 207, y: -400)
    let largePosition = CGPoint(x: 207, y: -1000)
    
    init(){
        menuPosition = smallPosition
    }
    
    var menuDrag : some Gesture{
        DragGesture()
            .onChanged({ value in
            
        })
    }
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .position(menuPosition)
                
        }
    }
}

struct WordCard_Previews: PreviewProvider {
    static var previews: some View {
        WordCard()
    }
}
