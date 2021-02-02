//
//  ContentView.swift
//  mobile-lab
//
//  Created by Max on 24.10.2020.
//  Copyright © 2020 Max. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    let userListViewModel = UserListViewModel()
    let repoViewModel = CharacterListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                InputFormView()
                NavigationLink(destination: ItemListView(viewModel: userListViewModel)) {
                    Text("View all users")
                    .padding()
                }.simultaneousGesture(TapGesture().onEnded({
                    userListViewModel.reloadUsers()
                }))
                NavigationLink(destination: ItemImageListView(viewModel: repoViewModel)) {
                    Text("See characters")
                        .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
