//
//  ClearButton.swift
//  mobile-lab
//
//  Created by Max on 25.10.2020.
//  Copyright © 2020 Max. All rights reserved.
//

import SwiftUI

struct ClearButton: ViewModifier {
    @Binding var text: String
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "delete.left")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }.padding(.trailing, 8)
            }
        }
    }
}
