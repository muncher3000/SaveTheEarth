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
    var body: some View {
        ZStack{
          
            
            Image("CityBackground")
                .resizable()
                .scaledToFit()
                .frame(width:500)
                .padding(.top, 450)
          
            SpriteView(scene: RainFall(), options: [.allowsTransparency])
            
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
                
                Image("Rai")
                                    
                Button{
                    resetUmbrella()
                }label: {
                    Text("Reset umbrella position")
                }
                .padding(.top, 740)
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
                
       
            

        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        
    }
    func resetUmbrella() {
        offset = .zero
    }
    
    func raining() {
        
      
    }
}

#Preview {
    AcidFoamView()
}


class RainFall : SKScene {
    override  func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: 0.5 , y: 1)
        backgroundColor = .clear
        let node = SKEmitterNode(fileNamed: "RainFall.sks")!
        addChild(node)
        
        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
}

class RainFallLanding : SKScene {
    override  func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: 0.5 , y: 1)
        backgroundColor = .clear
        let node = SKEmitterNode(fileNamed: "RainFallLanding.sks")!
        addChild(node)
        
        node.particlePositionRange.dx = UIScreen.main.bounds.width - 30
    }
}

// https://www.youtube.com/watch?v=_Ssae8NLHUs rainfall landing on umbrella 4 min 30 s
