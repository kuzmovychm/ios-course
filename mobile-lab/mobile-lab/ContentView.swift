//
//  ContentView.swift
//  mobile-lab
//
//  Created by Max on 24.10.2020.
//  Copyright © 2020 Max. All rights reserved.
//

import SwiftUI


struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

