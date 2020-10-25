//
//  ContentView.swift
//  mobile-lab
//
//  Created by Max on 24.10.2020.
//  Copyright © 2020 Max. All rights reserved.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .foregroundColor(Color.white)
                .padding(8)
                .background(LinearGradient(gradient: Gradient(colors: configuration.isPressed ? [Color.pink, Color.red] : [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(15.0)
                .scaleEffect(configuration.isPressed ? 1.02 : 1.0)
        }
}

struct ContentView: View {
    @State var name: String = ""
    @State var userInput: String = ""
    
    var body: some View {
        VStack {
            HStack(spacing: 30, content: {
                TextField("Input your name", text: $name)
                    .modifier(ClearButton(text: $name))
                Button(action: {
                    if !name.isEmpty {
                        self.userInput = name;
                    }
                }, label: {
                    Text("Say hello")
                }).buttonStyle(CustomButtonStyle())
            }).frame(width: 280)
            if !userInput.isEmpty {
                if #available(iOS 14.0, *) {
                    Label(title: { Text(("Hello " + userInput).trimmingCharacters(in: .whitespacesAndNewlines)) },
                          icon: { Text("") })
                } else {
                    Text("Hello " + userInput)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
