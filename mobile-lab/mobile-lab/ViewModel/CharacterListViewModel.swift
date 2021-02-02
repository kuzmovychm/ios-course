//
//  RepoListViewModel.swift
//  mobile-lab
//
//  Created by Max on 19.01.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import SwiftUI
import Alamofire

class CharacterListViewModel: ObservableObject {
    @Published private var model = CharacterList()
    @Published private var favourites = [Int]()
    @Published var showFavourites = false
    
    //MARK: - model access
    
    var listItems: [Character] {
        model.characters
    }
    
    private func setItems(characters: [Character]) -> Void {
        model.characters = characters
    }
    
    func isFavourite(_ character: Character) -> Bool {
        favourites.contains(character.id)
    }
    
    func addFavourite(_ character: Character) {
        favourites.append(character.id)
    }

    func removeFavourite(_ character: Character) {
        favourites.remove(at: favourites.firstIndex(of: character.id)!)
        if showFavourites {
            var characters = [Character]()
            for character in model.characters {
                if isFavourite(character) {
                    characters.append(character)
                }
            }
            setItems(characters: characters)
        }
    }
    
    func filterFavourites() {
        if !showFavourites {
            var characters = [Character]()
            for character in model.characters {
                if isFavourite(character) {
                    characters.append(character)
                }
            }
            setItems(characters: characters)
        } else {
            fetch() {}
        }
        showFavourites.toggle()
    }
    
    // MARK: - static init
    
    func fetch(onComplete: @escaping () -> Void) -> Void {
        self.setItems(characters: [Character]())
        AF.request("https://rickandmortyapi.com/api/character", method: .get, encoding: JSONEncoding.default).responseJSON { response in
            do {
                let characterWrapper = try JSONDecoder().decode(CharacterWrapper.self, from: response.data!)
                self.setItems(characters: characterWrapper.results)
                onComplete()
            } catch {
                print("Unable to decode characters (\(error))")
            }
        }
    }
    
}
