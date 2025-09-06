//
//  CatchFoamView.swift
//  saveTheEarth
//
//  Created by Sharlene Tan Qin Ying on 23/8/25.
//

import SwiftUI

struct CatchFoamView: View {
    @State private var index = 0
    @State private var text = ""
    
    private let stories = [
        "It's the year 3000, Global Warming has taken over the world.",
        "Acid rain has transformed into real ACID! The citizens are trapped in their homes as another ACID rain shower is coming.",
        "Your mission is to protect the citizens' homes from being destroyed."
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
                if index == 2 {
                    NavigationLink(destination: AcidFoamView()) {
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
    NavigationView {
        CatchFoamView()
    }
}
