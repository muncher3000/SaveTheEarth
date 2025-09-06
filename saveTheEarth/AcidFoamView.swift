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
    
    var body: some View {
        ZStack{
            SpriteView(scene: RainFall(), options: [.allowsTransparency])
            VStack{
                
                Image("CityBackground")
                    .resizable()
                    .scaledToFit()
                    .frame(width:500)
                    .padding(.top, 450)
                
                
            }
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 400, height: 100)
            
            
            
            if shown == true {
                ZStack{
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
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 370, height: 150)
                        .cornerRadius(20)
                        .opacity(0.3)
                }
            }
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
            }
            SpriteView(scene: RainFall(), options: [.allowsTransparency])

        }
        .navigationBarBackButtonHidden(true)
        
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
