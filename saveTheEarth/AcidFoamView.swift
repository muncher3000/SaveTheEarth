//
//  AcidFoamView.swift
//  saveTheEarth
//
//  Created by Sharlene Tan Qin Ying on 23/8/25.
//

import SwiftUI
import SpriteKit

struct AcidFoamView: View {
    @State private var offset = CGSize.zero
    @State private var shown: Bool = true
    @State private var umbrellaShown: Bool = false
    @State private var points : Int = 0
    @State private var gameWon: Bool = false
    
    var body: some View {
        ZStack{
            
            Image("CityBackground")
                .resizable()
                .scaledToFit()
                .frame(width:500)
                .padding(.top, 450)
          
            SpriteView(scene: createRainScene(), options: [.allowsTransparency])
            
            if umbrellaShown == true {
                Image("Umbrella")
                    .resizable()
                    .scaledToFit()
                    .frame(width:100)
                    .offset(offset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                offset = value.translation
                            }
                    )
                
                Button{
                    resetUmbrella()
                }label: {
                    Text("Reset umbrella position")
                }
                .padding(.top, 740)
                
                
                Text("Points: \(points)")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(10)
                    .padding(.top, 650)
                    
            }
            
            if shown == true {
                ZStack{
                    Rectangle()
                        .frame(width: 390, height: 100)
                        .foregroundStyle(.gray)
                        .opacity(1)
                        .cornerRadius(20)
                        .overlay(GeometryReader{_ in
                            SpriteView(scene: RainFallLanding(), options: [.allowsTransparency])
                        })
                    VStack{
                        Button{
                            shown = false
                            umbrellaShown = true
                        }
                        label: {
                            Text("Start")
                                .bold()
                                .font(.largeTitle)
                                .foregroundStyle(.black)
                            
                        }
                        Text("Instructions:")
                            .bold()
                        Text("Acid rain will fall, use the umbrella to block it!")
                    }
                }
                .padding(.bottom, 100)
            }
            
            
            if gameWon {
                
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 200)
                        .foregroundStyle(.green)
                        .opacity(0.9)
                        .cornerRadius(20)
                    
                    VStack {
                        Text("Congratulations!")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text("yeppp")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.top, 5)
                        
                        Text("Final Score: \(points)")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        
                        
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
    
    func createRainScene() -> RainFall {
        let scene = RainFall()
        scene.umbrellaPosition = { self.offset }
        scene.onPointsChange = { newPoints in
            self.points = newPoints
            if self.points >= 15 {
                self.gameWon = true
            }
        }
        return scene
    }
    
    func resetUmbrella() {
        offset = .zero
    }
}

#Preview {
    AcidFoamView()
}

class RainFall : SKScene {
    var umbrellaPosition: (() -> CGSize)?
    var onPointsChange: ((Int) -> Void)?
    var umbrellaNode: SKNode!
    var currentPoints: Int = 0
    
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        anchorPoint = CGPoint(x: 0.5 , y: 1)
        backgroundColor = .clear
        
        let node = SKEmitterNode(fileNamed: "RainFall.sks")!
        addChild(node)
        node.particlePositionRange.dx = UIScreen.main.bounds.width
        
        
        umbrellaNode = SKNode()
        umbrellaNode.position = CGPoint(x: 0, y: -UIScreen.main.bounds.height + 200)
        
        
        let umbrellaSize = CGSize(width: 80, height: 20)
        umbrellaNode.physicsBody = SKPhysicsBody(rectangleOf: umbrellaSize)
        umbrellaNode.physicsBody?.isDynamic = false
        umbrellaNode.physicsBody?.categoryBitMask = 2
        umbrellaNode.physicsBody?.contactTestBitMask = 1
        umbrellaNode.physicsBody?.collisionBitMask = 0
        
        addChild(umbrellaNode)
        
       
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -1)
        BiggRainDroplets()
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        if let getPosition = umbrellaPosition {
            let offset = getPosition()
            umbrellaNode.position = CGPoint(
                x: offset.width,
                y: -UIScreen.main.bounds.height + 200 + offset.height
            )
        }
        
        enumerateChildNodes(withName: "raindrop") { node, _ in
            if node.position.y < -self.size.height {
                node.removeFromParent()
            }
        }
    }
    
    func BiggRainDroplets() {
        let spawnAction = SKAction.run {
            self.spawnRaindrop()
        }
        let waitAction = SKAction.wait(forDuration: 1.0)
        let sequenceAction = SKAction.sequence([spawnAction, waitAction])
        let repeatAction = SKAction.repeatForever(sequenceAction)
        
        run(repeatAction)
    }
    
    func spawnRaindrop() {
       
        let raindrop = SKSpriteNode(imageNamed: "Rain")
        raindrop.name = "raindrop"
        raindrop.size = CGSize(width: 30, height: 30)
        

        let randomX = CGFloat.random(in: -size.width/2...size.width/2)
        raindrop.position = CGPoint(x: randomX, y: size.height/2)
        
     
        raindrop.physicsBody = SKPhysicsBody(rectangleOf: raindrop.size)
        raindrop.physicsBody?.categoryBitMask = 1
        raindrop.physicsBody?.contactTestBitMask = 2
        raindrop.physicsBody?.collisionBitMask = 0
        raindrop.physicsBody?.affectedByGravity = true
        
        addChild(raindrop)
    }
}

extension RainFall: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if contactMask == 3 {
            currentPoints += 1
            onPointsChange?(currentPoints)
            
      
            if contact.bodyA.categoryBitMask == 1 {
                contact.bodyA.node?.removeFromParent()
            } else {
                contact.bodyB.node?.removeFromParent()
            }
        }
    }
}

class RainFallLanding : SKScene {
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: 0.5 , y: 1)
        backgroundColor = .clear
        let node = SKEmitterNode(fileNamed: "RainFallLanding.sks")!
        addChild(node)
        
        node.particlePositionRange.dx = UIScreen.main.bounds.width - 30
    }
}

// https://www.youtube.com/watch?v=_Ssae8NLHUs RainFall + Collision tutorial
