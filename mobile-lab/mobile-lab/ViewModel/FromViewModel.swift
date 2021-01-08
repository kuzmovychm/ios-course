//
//  SampleForm.swift
//  mobile-lab
//
//  Created by Max on 24.12.2020.
//  Copyright © 2020 Max. All rights reserved.
//

import SwiftUI

class FromViewModel: ObservableObject {
    @Published private var form: InputForm = FromViewModel.create()
    @Published var errorMessage: String = ""
    
    // MARK: - Access to the Model
    
    var formFields: [InputField] {
        form.fields
    }
    
    func errorMessageText() -> String {
        var errors: [String] = []
        
        for field in form.fields {
            if let message = field.errorMessage {
                errors.append(message)
            }
        }
        
        return errors.isEmpty ? "" : errors.joined(separator: "\n")
    }
    
    
    // MARK: - Intents
    
    func setValue(id: Int, value: String) {
        if let index = form.fields.firstIndex(where: {$0.id == id}) {
            form.fields[index].value = value
        }
    }
    
    func validate() {
        for index in 0..<form.fields.count {
            let field = form.fields[index]
            
            if let errorMessage = field.getErrorMessage(field.value) {
                form.fields[index].errorMessage = errorMessage
            }
            
            if let id = field.equivalentID {
                if let index = form.fields.firstIndex(where: {$0.id == id}) {
                    if field.value != form.fields[index].value {
                        form.fields[index].errorMessage = "\(field.name) should be the same!"
                    }
                }
            }
        }
        
        errorMessage = errorMessageText()
    }
    
    // MARK: - Static init
    
    private static func create() -> InputForm {
        return InputForm(fields: generateFormFields())
    }
    
    private static func generateFormFields() -> [InputField] {
        return [
            InputField(id: 1, placeholder: "Enter your name...", getErrorMessage: ValidationUtil.notEmptyName),
            InputField(id: 2, placeholder: "Enter your surname...", getErrorMessage: ValidationUtil.notEmptySurname),
            InputField(id: 3, placeholder: "Enter your email...", getErrorMessage: ValidationUtil.validEmail),
            InputField(id: 4, placeholder: "Enter your phone...", keyboardType: .numberPad, getErrorMessage: ValidationUtil.validPhone),
            InputField(id: 5, placeholder: "Enter your password...", getErrorMessage: ValidationUtil.validPassword),
            InputField(id: 6, equivalentID: 5, name: "password", placeholder: "Repeat your password...", getErrorMessage: ValidationUtil.noMessage)
        ]
    }
    
}
