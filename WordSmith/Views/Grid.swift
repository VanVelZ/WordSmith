//
//  Grid.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 1/9/21.
//  Copyright © 2021 Zach Vandervelden. All rights reserved.
//

import SwiftUI

struct Grid<Item:Identifiable, ItemView:View>: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView){
        
        //@escaping means that the thing will not be used in this function call
        //functions types are reference types
        
        self.items = items
        self.viewForItem = viewForItem
    }
    var body: some View {
        
        GeometryReader { geo in
            ForEach(items){ item in
                let layout = GridLayout(itemCount: items.count, in: geo.size)
                let index = items.firstIndex(matching: item)!
                viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index))
            }
        }
    }
}

