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
    @ObservedObject var viewModel: CharacterListViewModel
    
    var body: some View {
            RefreshableScrollView(onRefresh: { done in
                print("Refresh!")
                viewModel.fetch() {
                    done()
                }
            }) {
                if (viewModel.listItems.isEmpty && !viewModel.showFavourites) {
                    Text("Loading data ...")
                } else {
                        VStack {
                            ForEach(viewModel.listItems, id: \.self) { character in
                                HStack {
                                    NavigationLink(destination: CharacterDetails(character: character)) {
                                        ItemView(character: character)
                                    }
                                    Image(systemName: "heart.fill")
                                        .padding()
                                        .foregroundColor(viewModel.isFavourite(character) ? .red : .blue)
                                        .onTapGesture {
                                            if (viewModel.isFavourite(character)) {
                                                viewModel.removeFavourite(character)
                                            } else {
                                                viewModel.addFavourite(character)
                                            }
                                        }
                                }
                          }
                            .navigationBarItems(trailing: Text(viewModel.showFavourites ? "Show all" : "Favourites").onTapGesture {
                                viewModel.filterFavourites()
                            })
                    }
                }
            }
            .onAppear() {
                viewModel.fetch() {
                    print("Text")
                }
            }
    }
}

struct ItemListView: View {
    @ObservedObject var viewModel: UserListViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.listItems, id: \.self) { item in
                Text("Mock")
            }
        }
    }
}

struct ItemView: View {
    var character: Character
    
    var body: some View {
        HStack {
            URLImage(url: URL(string: character.image)!,
                     content: { image in
                         image
                             .resizable()
                             .aspectRatio(contentMode: .fit)
         })
                .frame(width: 100, height: 100)
            
            
            VStack(alignment: .leading) {
                Text(character.name)
                Text(character.origin.name)
            }
                .padding()
                .foregroundColor(.black)
            
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
