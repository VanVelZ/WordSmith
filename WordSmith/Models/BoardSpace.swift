//
//  Letter.swift
//  WordSmith
//
//  Created by Zach Vandervelden on 2/9/21.
//  Copyright © 2021 Zach Vandervelden. All rights reserved.
//

import Foundation

struct BoardSpace: Identifiable{
    private(set) var id = UUID()
    private(set) var text: String
    private(set) var location: (x: Int, y: Int)
}
