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
        Text("Congrats!")
        SpriteView(scene: Fireworks(), options: [.allowsTransparency])
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
