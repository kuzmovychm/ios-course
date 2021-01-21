//
//  Repo.swift
//  mobile-lab
//
//  Created by Max on 20.01.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import Foundation

struct Repo: Codable {
    var name: String
    var owner: RepoOwner
}

struct RepoOwner: Codable {
    var login: String
    var avatar_url: String
}
