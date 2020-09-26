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

struct menu: View {
    
    @State private var menuPosition:CGPoint = CGPoint(x: 207, y: -200)
    @State private var offset:CGPoint = CGPoint.zero
    
    
    
    let smallPosition = CGPoint(x: 210, y: -200)
    let mediumPosition = CGPoint(x: 207, y: -400)
    let largePosition = CGPoint(x: 207, y: -1000)
    
    init(){
    }
    var body: some View {
        
        ScrollView(.horizontal){
            
        HStack{
            
            CardView()
            
            
            }
        }
        .position(smallPosition)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .frame(width: 400, height: 245)
        
    }
}


struct WordCard_Previews: PreviewProvider {
    static var previews: some View {
        menu()
    }
}

struct CardView: View {
    var body: some View {
        ZStack{
            WordList()
                .frame(width: 380, height: 180)
                .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)))
        }
    }
}

struct WordList: View {
    
    var displayWords:String = "\n"
    
    init(){
        for word in Settings.Words {
            displayWords.append("\(word.Text!.uppercased())\t\t")
            if (word.id == 3 || word.id == 8){
                displayWords.append("\n\n")
            }
        }
    }
    
    
    var body: some View {
        ForEach(Settings.Words){ word in
            
            Text(displayWords)
                .font(Font.custom("Courier New", size:20.0))
                .fontWeight(.bold)
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}
