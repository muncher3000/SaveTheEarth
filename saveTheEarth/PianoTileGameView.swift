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

    var body: some View {
        ZStack {
                    Text("OMG SONGPLAYS YAAYYYAYAYAY")
                }
                .onAppear(perform: {
                    playSounds("song.mp3")
                })
        .navigationBarBackButtonHidden(true)
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
