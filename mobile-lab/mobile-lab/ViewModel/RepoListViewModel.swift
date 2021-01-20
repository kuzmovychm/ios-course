//
//  RepoListViewModel.swift
//  mobile-lab
//
//  Created by Max on 19.01.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import SwiftUI

class RepoListViewModel: ObservableObject {
    private var model = RepoListViewModel.create()
    
    // MARK: - static init
    
    private static func create() -> ItemList {
        return ItemList()
    }
}
