//
//  PianoTileGameView.swift
//  saveTheEarth
//
//  Created by Sharlene Tan Qin Ying on 8/9/25.
//

import SwiftUI
import AVFoundation

struct FoamTile: Identifiable {
    let id = UUID()
    let row: Int
    var position: CGFloat = -50
    var isPressed = false
}

struct PianoTileGameView: View {
    var sound = true
    @State var audioPlayer: AVAudioPlayer!
    @State var gameStart = false
    @State var instructions = true
    @State private var points = 0
    @State private var foamTiles: [FoamTile] = []
    @State private var gameTimer: Timer?
    @State private var gameTime: Double = 0
    @State private var nextfoam: Set<Int> = []
    
    private let foamSequence: [(time: Double, row: Int)] = [
        (0.9, 0),
        (1.5, 2),
        (1.4, 1),
        (2.2, 3),
        (2.6, 0),
        (3.0, 1),
        (3.2, 2),
        (3.5, 3),
        (3.8, 0),
        (4.20, 1), //10
        (4.60, 0),
        (5.0, 2),
        (5.2, 1),
        (5.4, 3),
        (5.8, 0),
        (6.2, 1),
        (6.6, 2),
        (7.0, 3),
        (7.45, 0),
        (7.9, 1), //20
        (8.3, 0),
        (8.8, 2),
        (9.0, 1),
        (9.4, 3),
        (9.85, 0),
        (10.20, 1),
        (10.40, 2),
        (10.85, 3),
        (11.30, 0),
        (11.70, 1), //30
        (11.90, 0),
        (12.35, 2),
        (12.75, 1),
        (13.2, 3),
        (13.4, 0),
        (13.7, 1),
        (14.15, 2),
        (14.6, 3),
        (15.0, 0),
        (15.2, 1), //40
        (15.7, 0),
        (16.1, 2),
        (16.5, 1),
        (16.7, 3),
        (17.1, 0),
        (17.5, 1),
        (18.0, 2),
        (18.4, 3),
        (18.6, 0),
        (19.1, 1), //50
    ]
    
    var body: some View {
        
        NavigationStack{
            
            if instructions {
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 350, height: 150)
                        .foregroundStyle(.gray)
                        .opacity(0.3)
                    VStack {
                        Text("Instructions:")
                            .bold()
                            .font(.largeTitle)
                        Text("Tap the falling foam when it reaches the colourful circles")
                        Button("Start") {
                            gameStart = true
                            instructions = false
                            startGame()
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
            
            if gameStart {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack{
                            Text("Points: \(points)")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                            Button{
                                
                            }label:{
                                Text("Retry")
                            }
                        }
                        
                        Spacer()
                        
                        ZStack {
                            ForEach(foamTiles) { tile in
                                if !tile.isPressed {
                                    Image("Foam")
                                        .resizable()
                                        .frame(width: 60, height: 100)
                                        .position(
                                            x: CGFloat(tile.row * 100 + 50),
                                            y: tile.position
                                        )
                                        .onTapGesture {
                                            afterFoamisTapped(tile)
                                        }
                                }
                            }
                        }
                        
                    }
                }
                .onAppear {
                    if sound {
                        playSounds("song.mp3")
                    }
                }
            }
            
            if points >= 40{
                Text("Too much foam entered the sea...")
                    .onAppear{gameStart = false}
                NavigationLink{
                    CompleteGameView()
                }label:{
                    Text("ohnoooo!")
                }
            }
        }
    }
    
    
    func startGame() {
        gameTimer = Timer.scheduledTimer(withTimeInterval: 0.016, repeats: true) { _ in
            gameTime += 0.016
            foamDroppingThingy()
        }
    }
    
    func foamDroppingThingy() {
        for (index, sequence) in foamSequence.enumerated() {
            if gameTime >= sequence.time && !nextfoam.contains(index) {
                foamTiles.append(FoamTile(row: sequence.row))
                nextfoam.insert(index)
            }
        }
        
        for i in foamTiles.indices {
            if !foamTiles[i].isPressed {
                foamTiles[i].position += 3
            }
        }
        
        
    }
    
    func afterFoamisTapped(_ tile: FoamTile) {
        if let index = foamTiles.firstIndex(where: { $0.id == tile.id }) {
            foamTiles[index].isPressed = true
            points += 1
        }
    }
    
    func playSounds(_ soundFileName: String) {
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
