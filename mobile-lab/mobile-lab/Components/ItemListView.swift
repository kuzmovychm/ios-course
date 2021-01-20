//
//  ItemListView.swift
//  mobile-lab
//
//  Created by Max on 19.01.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import SwiftUI

struct ItemListView: View {
    @ObservedObject var listView = UserListViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(listView.listItems, id: \.self) { item in
                Text(item.header)
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
