//
//  CompleteGameView.swift
//  saveTheEarth
//
//  Created by Sharlene Tan Qin Ying on 23/8/25.
//

import SwiftUI
import SpriteKit

struct CompleteGameView: View {
    let image1 = UIImage(named: "Earth12")
    let image2 = UIImage(named: "terminate")
    var body: some View {
        ZStack{
            SpriteView(scene: Fireworks(), options: [.allowsTransparency])
            VStack{
                Text("You couldn't save the world...")
                    .bold()
                    .font(.system(size: 30))
                Text("But you can try one last thing")
                    .bold()
                    .font(.system(size: 25))
                Button("Save the Earth") {
                    let imageSaver = ImageSaver()
                    imageSaver.writeToPhotoAlbum(image: image1!)
                }
                .font(.system(size: 28))
                .bold()
                .background(Color.lightGreen)
                .foregroundStyle(.black)
                .clipShape(.rect(cornerRadius: 10))
                
                NavigationLink{
                    CheckpointView()
                } label: {
                    Text("Checkpoints")
                        .foregroundStyle(.blue)
                        
                }
                Button("Secret bonus") {
                    let imageSaver = ImageSaver()
                    imageSaver.writeToPhotoAlbum(image: image2!)
                }
            }
        }
        .ignoresSafeArea(edges: .all)
    }
}

#Preview {
    CompleteGameView()
}

class Fireworks : SKScene {
    override  func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: 0.5 , y: 1)
        backgroundColor = .clear
        let node = SKEmitterNode(fileNamed: "Fireworks.sks")!
        addChild(node)
        
        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
}
