//
//  Selection.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 7/27/20.
//  Copyright © 2020 Zach Vandervelden. All rights reserved.
//

import SwiftUI

struct Selection: View {
    
    @State private var location = CGPoint.zero
    @State private var startlocation = CGPoint.zero
    @State var isDrawing = false
    
    func Drawing() {
        self.isDrawing = true
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.isDrawing = false
        }
    }
    
    var body: some View {
        GeometryReader { geometryProxy in
            ZStack {
                Rectangle()
                    .opacity(0.1)
                    .gesture(DragGesture(minimumDistance: 0).onChanged{ value in
                        self.startlocation = value.startLocation
                        self.location = value.location
                        self.isDrawing = true
                    }.onEnded { value in
                        self.location = value.location // < here !!
                        self.Drawing()
                        self.isDrawing = false
                    }).colorInvert()
                if self.isDrawing {
                    Path{ path in
                        path.move(to: self.startlocation)
                        path.addLine(to: self.startlocation)
                        path.addLine(to: self.location)
                        
                    }
                    .stroke(Color.blue, lineWidth: 5)
                    
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}


struct Selection_Previews: PreviewProvider {
    static var previews: some View {
        Selection()
    }
}
