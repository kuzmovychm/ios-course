//
//  InputForm.swift
//  mobile-lab
//
//  Created by Max on 24.12.2020.
//  Copyright © 2020 Max. All rights reserved.
//

import SwiftUI

struct InputForm {
    var fields: [InputField]
}

struct InputField: Identifiable {
    var id: Int
    var equivalentID: Int?
    var name: String = ""
    var value: String = ""
    var placeholder: String
    var errorMessage: String?
    var keyboardType: UIKeyboardType = .default
    var getErrorMessage: (_ value: String) -> String?
}

enum FieldKeys: Int {
    case name = 0
    case surname
    case email
    case phone
    case password
    case passwordConfirmation
}
