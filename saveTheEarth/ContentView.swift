//
//  ContentView.swift
//  saveTheEarth
//
//  Created by Sharlene Tan Qin Ying on 26/7/25.
//

import SwiftUI
struct ContentView: View {
    @State private var isEarthShow = true
    var body: some View {
        VStack {
            if isEarthShow == true{
                Image("earth")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            if isEarthShow == false {}
            Button {
                if isEarthShow == true {
                    isEarthShow = false
                }
                
            } label: {
                Text("Save the earth")
                    .font(.largeTitle)
                    .monospaced()
                    .bold()
                    .background(.green)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 10))
                    
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
