//
//  ItemListView.swift
//  mobile-lab
//
//  Created by Max on 19.01.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import SwiftUI

struct ItemImageListView: View {
    @ObservedObject var viewModel: RepoListViewModel
    
    var body: some View {
        viewModel.fetch()
        return ScrollView {
            ForEach(viewModel.listItems, id: \.self) { item in
                ItemView(item: item)
            }
        }
    }
}

struct ItemListView: View {
    @ObservedObject var viewModel: UserListViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.listItems, id: \.self) { item in
                ItemView(item: item)
            }
        }
    }
}

struct ItemView: View {
    var item: ListItem
    
    var body: some View {
        VStack {
            Text(item.header)
            Text(item.body)
        }
        .padding()
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(viewModel: UserListViewModel())
    }
}
