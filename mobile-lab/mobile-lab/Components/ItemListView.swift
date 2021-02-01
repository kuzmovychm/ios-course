//
//  ItemListView.swift
//  mobile-lab
//
//  Created by Max on 19.01.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import SwiftUI
import URLImage

struct ItemImageListView: View {
    @ObservedObject var viewModel: RepoListViewModel
    
    var body: some View {
        return ScrollView {
            ForEach(viewModel.listItems, id: \.self) { item in
                ItemView(item: item)
            }
        }
        .onAppear() {
            viewModel.fetch()
        }
    }
}

struct ItemListView: View {
    @ObservedObject var viewModel: UserListViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.listItems, id: \.self) { item in
                return ItemView(item: item)
            }
        }
    }
}

struct ItemView: View {
    var item: ListItem
    
    var body: some View {
        HStack {
            URLImage(url: URL(string: item.imageURL!)!,
                     content: { image in
                         image
                             .resizable()
                             .aspectRatio(contentMode: .fit)
         })
                .frame(width: 100, height: 100)
            
            
            VStack {
                Text(item.header)
                Text(item.body)
            }
                .padding()
            
            Spacer()
            
        }
            .padding()
        
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(viewModel: UserListViewModel())
    }
}
