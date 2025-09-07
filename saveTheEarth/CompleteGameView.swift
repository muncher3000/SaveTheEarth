//
//  CompleteGameView.swift
//  saveTheEarth
//
//  Created by Sharlene Tan Qin Ying on 23/8/25.
//

import SwiftUI
import SpriteKit

struct CompleteGameView: View {
    var body: some View {
        ZStack{
            SpriteView(scene: Fireworks(), options: [.allowsTransparency])
            VStack{
                Text("Congrats!")
                    .bold()
                    .font(.system(size: 40))
                Text("You've finished the game!!")
                    .bold()
                    .font(.system(size: 25))
                
                NavigationLink{
                    CheckpointView()
                } label: {
                    Text("Checkpoints")
                        .foregroundStyle(.blue)
                        
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
