//
//  CharacterDetails.swift
//  mobile-lab
//
//  Created by Max on 02.02.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import SwiftUI
import URLImage

struct CharacterDetails: View {
    var character: Character
    
    var body: some View {
        VStack {
            ResizebleImage(url: character.image)
                .padding()
            VStack(alignment: .leading) {
                Text("Name: \(character.name)")
                    .padding(3)
                Text("Gender: \(character.gender)")
                    .padding(3)
                Text("Status: \(character.status)")
                    .padding(3)
                Text("Species: \(character.species)")
                    .padding(3)
                Text("Origin: \(character.origin.name)")
                    .padding(3)
                Text("Location: \(character.location.name)")
                    .padding(3)
            }
            Spacer()
        }
    }
}

struct ResizebleImage: View {
    @State private var isFullscreenImage = false
    let url: String
    
    var body: some View {
        if #available(iOS 14.0, *) {
            URLImage(url: URL(string: url)!,
                     content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                     }).onTapGesture {
                        isFullscreenImage.toggle()
                     }
                .fullScreenCover(isPresented: $isFullscreenImage) {
                    FullScreenModalView(url: url)
                }
        } else {
            
        }
    }
}

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    var url: String

    var body: some View {
        URLImage(url: URL(string: url)!,
                 content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                 })
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
    }
}
