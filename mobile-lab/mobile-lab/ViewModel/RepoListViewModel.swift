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
    @Published private var model = ItemList()
    
    //MARK: - model access
    
    var listItems: [ListItem] {
        model.items
    }
    
    private func setItems(items: [ListItem]) -> Void {
        model.items = items
    }
    
    // MARK: - static init
    
    func fetch(onComplete: @escaping () -> Void) -> Void {
        self.setItems(items: [ListItem]())
        AF.request("https://rickandmortyapi.com/api/character", method: .get, encoding: JSONEncoding.default).responseJSON { response in
            do {
                let characterWrapper = try JSONDecoder().decode(CharacterWrapper.self, from: response.data!)
                var repoItems = [ListItem]()
                for character in characterWrapper.results {
                    repoItems.append(ListItem(header: character.name, body: "\(character.species) / \(character.status)", imageURL: character.image))
                }
                self.setItems(items: repoItems)
                onComplete()
            } catch {
                print("Unable to decode characters (\(error))")
            }
        }
    }
    
}
