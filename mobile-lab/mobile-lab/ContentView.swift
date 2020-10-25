//
//  ContentView.swift
//  mobile-lab
//
//  Created by Max on 24.10.2020.
//  Copyright © 2020 Max. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var name: String
    
    var body: some View {
        VStack {
            TextField("Input your name", text: $name)
            Button(action: {
                print("Button pressed!")
            }, label: {
                Text("Say hello")
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        ContentView(name: "")

    }
}
