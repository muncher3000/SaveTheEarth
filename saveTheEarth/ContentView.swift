//
//  ContentView.swift
//  saveTheEarth
//
//  Created by Sharlene Tan Qin Ying on 26/7/25.
//

import SwiftUI

struct ContentView: View {
    let green = Color(hue: 121, saturation: 37, brightness: 87, opacity: 1)
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .font(.system(size: 200))
            Text("Save The World")
                .fontDesign(.monospaced)
                .font(.system(size: 40, weight: .bold))
            NavigationLink {
                CheckpointView()
            } label: {
                Label("", systemImage: "restart")
                    .scaleEffect(x: -1, y: -1, anchor: .center)
                    .bold()
                    .font(.system(size : 50))
                    .foregroundColor(green)
                    .padding(10)
                    
            }
            
            }
        }
}

#Preview {
    ContentView()
}
