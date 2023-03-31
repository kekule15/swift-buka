//
//  AsyncImagePage.swift
//  Buka
//
//  Created by Augustus Onyekachi on 31/03/2023.
//

import SwiftUI

extension Image {
    func imageModifer() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier()-> some View{
        self
            .imageModifer()
            .frame(maxWidth: 120)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct AsyncImagePage: View {
    private let ImageUrl: String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
//        AsyncImage(url: URL(string: ImageUrl), scale: 3.0){
//            image in image
//                .imageModifer()
//
//        }placeholder: {
//            Image(systemName: "photo.circle.fill").iconModifier()
//
//        }
//        .padding(40)
        
//        AsyncImage(url: URL(string: ImageUrl), scale: 3.0){
//            phase in
//                    if   let image = phase.image{
//                image.imageModifer()
//            }
//                       else if phase.error != nil {
//                Image(systemName: "ant.circle.fill").iconModifier()
//            }
//                       else{
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//        }
//        .padding(40.0)
        
        
        
        AsyncImage(url: URL(string: ImageUrl), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))){
            phase in
            switch phase{
            case .success(let image):
                image.imageModifer()
                    .transition(.move(edge: .bottom))
            case.failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
           
        }
        .padding(40.0)
    }
}

struct AsyncImagePage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImagePage()
    }
}
