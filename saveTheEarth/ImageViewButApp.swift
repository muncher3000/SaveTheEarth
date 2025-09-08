//
//  ImageViewButApp.swift
//  saveTheEarth
//
//  Created by T Krobot on 8/9/25.
//

import SwiftUI

struct ImageViewButApp: View {
    let image1 = UIImage(named: "Earth12")
    let image2 = UIImage(named: "terminate")
    var body: some View {
        VStack {
            Button("Save Image") {
                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbum(image: image1!)
            }
            Button("Save Image (again)") {
                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbum(image: image2!)
            }
        }
        .padding()
    }
}

#Preview {
    ImageViewButApp()
}
