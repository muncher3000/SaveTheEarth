//
//  PianoTileView.swift
//  saveTheEarth
//
//  Created by Sharlene Tan Qin Ying on 7/9/25.
//

import SwiftUI

struct PianoTileView: View {
    @State private var index = 0
    @State private var text = ""
    private let stories = [
        "The signboard has crushed the firestation, Toxic gas is beign released",
        "Rumor has it that a legendary net can catch this special gas",
        "But the net has been long gone, scattered in the city.",
        "Find the peices and connect them"
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color(.lightGreen))
                .frame(width: 380, height: 180)
                .cornerRadius(20)
            
            VStack {
                Text(text)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .medium))
                    .padding(20)
                
                if index < stories.count - 1 {
                    Button("Next") { next() }
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(8)
                }
                if index == 3 {
                    NavigationLink(destination: PianoTileGameView()) {
                        Text("Start")
                    }
                }
         
            }
        }
        .onAppear { type() }
        .onTapGesture { next() }
        .navigationBarBackButtonHidden(true)
    }
    
    private func type() {
        text = ""
        for (i, char) in stories[index].enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.03) {
                text.append(char)
            }
        }
    }
    
    private func next() {
        index += 1
        type()
    }
}

#Preview {
    NavigationView{
        PianoTileView()
    }
}
