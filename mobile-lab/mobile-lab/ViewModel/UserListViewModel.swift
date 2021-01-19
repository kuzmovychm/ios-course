//
//  UserListViewModel.swift
//  mobile-lab
//
//  Created by Max on 19.01.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import SwiftUI

class UserListViewModel: ObservableObject {
    @Published private var model = UserListViewModel.create()
    
    // MARK: - static init
    
    private static func create() -> ListView? {
        if let usersData = UserDefaults.standard.data(forKey: "LabAppUsersData") {
            do {
                var userList = [ListItem]()
                let users = try JSONDecoder().decode([User].self, from: usersData)
                for user in users {
                    userList.append(ListItem(header: "\(user.name) \(user.surname)", body: user.phone))
                }
                
                return ListView(items: userList)
            } catch {
                print("Unable to load users (\(error))")
            }
        }
        
        return ListView()
    }
}
