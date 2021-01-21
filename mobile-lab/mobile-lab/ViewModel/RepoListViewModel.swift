//
//  RepoListViewModel.swift
//  mobile-lab
//
//  Created by Max on 19.01.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import SwiftUI
import Alamofire

class RepoListViewModel: ObservableObject {
    private var model = ItemList()
    
    //MARK: - model access
    
    var listItems: [ListItem] {
        model.items
    }
    
    private func setItems(items: [ListItem]) -> Void {
        model.items = items
    }
    
    // MARK: - static init
    
    func fetch() -> Void {
        AF.request("https://api.github.com/orgs/square/repos").responseJSON { response in
            do {
                let json = response.data
                let repos = try JSONDecoder().decode([Repo].self, from: json!)
                var repoItems = [ListItem]()
                for repo in repos {
                    repoItems.append(ListItem(header: repo.name, body: repo.owner.login, imageURL: repo.owner.avatar_url))
                }
                self.setItems(items: repoItems)
            } catch {
                print("Unable to decode users (\(error))")
            }
        }
    }
    
}
