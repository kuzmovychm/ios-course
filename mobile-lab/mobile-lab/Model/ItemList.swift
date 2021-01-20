//
//  ListView.swift
//  mobile-lab
//
//  Created by Max on 15.01.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import SwiftUI

struct ItemList {
    var items = [ListItem]()
}

struct ListItem: Hashable {
    var header: String
    var body: String
    var imageURL: String?
}
