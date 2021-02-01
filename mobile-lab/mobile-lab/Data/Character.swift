//
//  Character.swift
//  mobile-lab
//
//  Created by Max on 01.02.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import Foundation

class CharacterWrapper: Codable {
    var info: CharacterInfo
    var results: [Character]
}

struct CharacterInfo: Codable {
    var count: Int?
    var pages: Int?
    var next: String?
    var prev: String?
}

struct Character: Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var gender: String
    var origin: ObjectInfo
    var location: ObjectInfo
    var image: String
}

struct ObjectInfo: Codable {
    var name: String
    var url: String
}
