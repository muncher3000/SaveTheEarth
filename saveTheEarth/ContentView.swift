//
//  ContentView.swift
//  saveTheEarth
//
//  Created by Sharlene Tan Qin Ying on 26/7/25.
//

import SwiftUI
struct ContentView: View {
    @State private var isEarthShow = true
    @State private var Clouds = false
    var body: some View {
        NavigationStack{
            VStack {
                if isEarthShow == true{
                    Image("Images")
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
                if isEarthShow == false {}
                Button {
                    withAnimation(.easeInOut(duration: 3)) {
                        if isEarthShow == true {
                            isEarthShow = false
                            Clouds = true
                        }
                    }
                    
                } label: {
                    Text("Save the earth")
                        .font(.largeTitle)
                        .monospaced()
                        .bold()
                        .background(Color.lightGreen)
                        .foregroundStyle(.black)
                        .clipShape(.rect(cornerRadius: 10))
                    
                }
                
                if Clouds == true {
                    withAnimation(.easeInOut(duration: 3)) {
                        Image("Cloud")
                            .transition(.slide)
                    }
                    
                    NavigationLink{
                        CheckpointView()
                    } label: {
                        Text("Start")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                        
                    }
                    
                    
                }
            }
        }
    }
}

#Preview {
 
        ContentView()
    
}
