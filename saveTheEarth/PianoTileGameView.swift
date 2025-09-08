//
//  PianoTileGameView.swift
//  saveTheEarth
//
//  Created by Sharlene Tan Qin Ying on 8/9/25.
//

import SwiftUI
import AVFoundation

struct PianoTileGameView: View {
    var sound = true
    @State var audioPlayer: AVAudioPlayer!
    @State var gameStart = false
    @State var instructions = true

    var body: some View {
        if instructions == true{
            ZStack {
                Rectangle()
                    .cornerRadius(20)
                    .frame(width: 350, height: 150)
                    .foregroundStyle(.gray)
                    .opacity(0.3)
                VStack{
                    Text("Instructions:")
                        .bold()
                        .font(.largeTitle)
                    Text("Tap the fallign foam when it reaches the colourful circles")
                    Button{
                        gameStart = true
                    }label:{
                        Text("Start")
                    }
                }
            }
            .onAppear(perform: {
                playSounds("song.mp3")
            })
            .navigationBarBackButtonHidden(true)
        }
        if gameStart == true{
            
        }
    }
    
   
    func playSounds(_ soundFileName : String) {
            guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
                fatalError("Unable to find \(soundFileName) in bundle")
            }

            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            } catch {
                print(error.localizedDescription)
            }
            audioPlayer.play()
        }
}

#Preview {
    PianoTileGameView()
}
