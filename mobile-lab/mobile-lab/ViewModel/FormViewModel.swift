//
//  SampleForm.swift
//  mobile-lab
//
//  Created by Max on 24.12.2020.
//  Copyright © 2020 Max. All rights reserved.
//

import SwiftUI

class FormViewModel: ObservableObject {
    @Published private var form = FormViewModel.create()
    @Published var errorMessage: String?
    
    // MARK: - Access to the Model
    
    var formFields: [InputField] {
        form.fields
    }
    
    
    // MARK: - Intents
    
    func setValue(id: Int, value: String) {
        if let index = form.fields.firstIndex(where: {$0.id == id}) {
            form.fields[index].value = value
        }
    }
    
    func validateAndSaveUser() {
        validate()
        if let errorMessageText = getErrorMessage() {
            errorMessage = errorMessageText
        } else {
            errorMessage = nil
            saveUser()
            clearInput()
        }
    }
    
    private func validate() -> Void {
        for index in 0..<form.fields.count {
            let field = form.fields[index]
            form.fields[index].errorMessage = field.getErrorMessage(field.value)
            
            if let id = field.equivalentID {
                if let index = form.fields.firstIndex(where: {$0.id == id}) {
                    if field.value != form.fields[index].value {
                        form.fields[index].errorMessage = "\(field.name) should be the same!"
                    }
                }
            }
        }
    }
    
    private func clearInput() -> Void {
        for index in 0..<form.fields.count {
            form.fields[index].value = ""
        }
    }
    
    private func getErrorMessage() -> String? {
        var errors: [String] = []
        
        for field in form.fields {
            if let message = field.errorMessage {
                errors.append(message)
            }
        }
        
        return errors.isEmpty ? nil : errors.joined(separator: "\n")
    }
    
    private func saveUser() -> Void {
        if let usersData = UserDefaults.standard.data(forKey: "LabAppUsersData") {
            do {
                let users = try JSONDecoder().decode([User].self, from: usersData)
                addUser(users: users)
            } catch {
                print("Unable to decode users (\(error))")
            }
        } else {
            addUser(users: [User]())
        }
    }
    
    private func addUser(users: [User]) {
        do {
            var newUsers = Array(users)
            let user = User(name: form.fields[0].value, surname: form.fields[1].value, phone: form.fields[2].value)
            newUsers.append(user)
            let updatedUsersData = try JSONEncoder().encode(newUsers)
            UserDefaults.standard.set(updatedUsersData, forKey: "LabAppUsersData")
        } catch {
            print("Unable to add users (\(error))")
        }
    }
    
    // MARK: - Static init
    
    private static func create() -> InputForm {
        return InputForm(fields: generateFormFields())
    }
    
    private static func generateFormFields() -> [InputField] {
        return [
            InputField(id: 0, placeholder: "Enter your name...", getErrorMessage: ValidationUtil.notEmptyName),
            InputField(id: 1, placeholder: "Enter your surname...", getErrorMessage: ValidationUtil.notEmptySurname),
            InputField(id: 2, placeholder: "Enter your email...", getErrorMessage: ValidationUtil.validEmail),
            InputField(id: 3, placeholder: "Enter your phone...", keyboardType: .numberPad, getErrorMessage: ValidationUtil.validPhone),
            InputField(id: 4, placeholder: "Enter your password...", getErrorMessage: ValidationUtil.validPassword),
            InputField(id: 5, equivalentID: 4, name: "password", placeholder: "Repeat your password...", getErrorMessage: ValidationUtil.noMessage)
        ]
    }
    
}