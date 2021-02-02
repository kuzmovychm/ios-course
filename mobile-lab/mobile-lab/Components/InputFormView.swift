//
//  InputFormView.swift
//  mobile-lab
//
//  Created by Max on 19.01.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import SwiftUI

struct InputFormView: View {
    @ObservedObject var sampleForm = FormViewModel()
    
    var body: some View {
        VStack {
            ForEach(sampleForm.formFields) { field in
                TextField(field.placeholder, text: Binding<String>(
                    get: {field.value},
                    set: {
                        sampleForm.setValue(id: field.id, value: $0)
                    }
                ))
                .keyboardType(field.keyboardType)
            }
            .padding()

            if let errorMessage = sampleForm.errorMessage {
                Text(errorMessage)
            }
            
            Button("Submit", action: sampleForm.validateAndSaveUser)
        }
    }
}

struct InputFormView_Previews: PreviewProvider {
    static var previews: some View {
        InputFormView()
    }
}
