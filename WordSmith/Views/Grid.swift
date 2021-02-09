//
//  Grid.swift
//  Memorize
//
//  Created by Zach Vandervelden on 12/26/20./Users/zachvandervelden/Downloads/GridLayout.swift
//

import SwiftUI

extension Grid where Item:Identifiable, ID == Item.ID {
    init(_ items:[Item], viewForItem: @escaping (Item) -> ItemView){
        self.init(items, id: \Item.id, viewForItem: viewForItem)
    }
}


struct Grid<Item, ItemView:View, ID:Hashable>: View {
    private var items: [Item]
    private var id: KeyPath<Item,ID>
    private var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], id: KeyPath<Item, ID>, viewForItem: @escaping (Item) -> ItemView){
        self.items = items
        self.id = id
        self.viewForItem = viewForItem
    }
    var body: some View {
        
        GeometryReader { geo in
            ForEach(items, id: id){ item in
                let layout = GridLayout(itemCount: items.count, in: geo.size)
                let index = items.firstIndex(where: {item[keyPath: id] == $0[keyPath: id] })
                viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index!))
            }
        }
    }
}
