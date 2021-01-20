//
//  ContentView.swift
//  mobile-lab
//
//  Created by Max on 24.10.2020.
//  Copyright © 2020 Max. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    let userListModel = UserListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                InputFormView()
                NavigationLink(destination: ItemListView(listView: userListModel)) {
                    Text("View all users")
                    .padding()
                }.simultaneousGesture(TapGesture().onEnded({
                    userListModel.reloadUsers()
                }))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

