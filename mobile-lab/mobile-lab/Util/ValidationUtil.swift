//
//  ValidationUtil.swift
//  mobile-lab
//
//  Created by Max on 24.12.2020.
//  Copyright © 2020 Max. All rights reserved.
//

import Foundation

struct ValidationUtil {
    static func notEmptyName(value: String) -> String? {
        return notEmpty(string: value, name: "Name")
    }

    static func notEmptySurname(value: String) -> String? {
        return notEmpty(string: value, name: "Surname")
    }
    
    static func validEmail(value: String) -> String? {
        if let errorMessage = notEmpty(string: value, name: "Email") {
            return errorMessage
        } else {
            let regex = NSRegularExpression("[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}")
            return regex.matches(value) ? nil : "Invalid email!"
        }
    }
    
    static func validPhone(value: String) -> String? {
        if let errorMessage = notEmpty(string: value, name: "Phone") {
            return errorMessage
        } else {
            let regex = NSRegularExpression("[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\\s\\./0-9]*")
            return regex.matches(value) ? nil : "Invalid phone!"
        }
    }
    
    static func validPassword(value: String) -> String? {
        return value.count >= 8 ? nil : "Password should contain 8 or more symbols!"
    }
    
    static func noMessage(value: String) -> String? {
        return nil
    }
    
    private static func notEmpty(string: String, name: String) -> String? {
        return string.count > 0 ? nil : "\(name) can not be empty!"
    }
}
