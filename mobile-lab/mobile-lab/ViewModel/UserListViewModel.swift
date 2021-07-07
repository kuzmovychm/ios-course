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
    
    // MARK: - Access to the Model
    
    var listItems: [ListItem] {
        model.items
    }
    
    // MARK: - Intents
    
    func reloadUsers() -> Void {
        model.items = UserListViewModel.getUserListItems()
    }
    
    
    // MARK: - static init
    
    private static func create() -> ItemList {
        return ItemList(items: getUserListItems())
    }
    
    private static func getUserListItems() -> [ListItem] {
        var userList = [ListItem]()
        let users = loadUsers()
        for user in users {
            userList.append(ListItem(header: "\(user.name) \(user.surname)", body: user.phone))
        }
        
        return userList
    }
    
    private static func loadUsers() -> [User] {
        if let usersData = UserDefaults.standard.data(forKey: "LabAppUsersData") {
            do { return try JSONDecoder().decode([User].self, from: usersData)}
            catch { print("Unable to load users (\(error))") }
        }
        
        return [User]()
    }
}
