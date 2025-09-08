//
//  CheckpointView.swift
//  saveTheEarth
//
//  Created by Sharlene Tan Qin Ying on 2/8/25.
//

import SwiftUI

struct CheckpointView: View {
    @State private var acidRainLocked = false
    @State private var CatchFoamLocked = true
    @State private var IncineratorLocked = true
    @State private var NewsLocked = true
    @State private var PipesLocked = true
    struct Goal: Identifiable {
        let name: String
        let id = UUID()
    }
    private var goals = [
        Goal(name: "Set up a recycling bin at home"),
        Goal(name: "Plant a plant at home"),
        Goal(name: "Dont use the AC"),
        Goal(name: "Turn off the lights"),
        Goal(name: "Reduce food and water waste"),
        Goal(name: "Avoid single-use plastics")
    ]
    var body: some View {
        VStack{
            ZStack{
                LinearGradient(
                       colors: [.lightBlue, .lightGreen, .lightBlue, .lightGreen],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing
                   )
                .mask {
                        Rectangle()
                            .frame(width: 250, height: 80)
                            .cornerRadius(20)
                            .foregroundStyle(Color(.lightBlue))
                            
                    }
                .padding(.bottom, 200)
                Text("Checkpoints")
                    .bold()
                    .font(.largeTitle)
                    .padding(.bottom, 200)
                VStack{
                    Text("Goals:")
                        .bold()
                        .font(.title)
                      
                    List(goals) {
                            Text($0.name)
                        }
                    .padding(.bottom, 10)
                    
                }
                .padding(.top, 200)
            }
            
            .ignoresSafeArea()
            
            
            
            ScrollView{
                    ZStack{
                        Rectangle()
                            .frame(width: 350, height: 100)
                            .cornerRadius(40)
                            .foregroundStyle(Color(.lightGreen))
                        
                        NavigationLink{
                            CatchFoamView()
                        } label: {
                            Label("Acid Rain", systemImage: "cloud.rain")
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                            
                        }
                    }
                    ZStack{
                        Rectangle()
                            .frame(width: 350, height: 100)
                            .cornerRadius(40)
                            .foregroundStyle(Color(.lightBlue))
                        NavigationLink{
                            PianoTileView()
                        } label: {
                            Label("Catch Foam", systemImage: "cloud")
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                        }
                        
                        
                    }
                    ZStack{
                        Rectangle()
                            .frame(width: 350, height: 100)
                            .cornerRadius(40)
                            .foregroundStyle(Color(.lightGreen))
                        NavigationLink{
                            IncineratorView()
                        } label: {
                            Label("Incinerator", systemImage: "flame")
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                            
                        }
                        
                    }
                    ZStack{
                        Rectangle()
                            .frame(width: 350, height: 100)
                            .cornerRadius(40)
                            .foregroundStyle(Color(.lightBlue))
                        NavigationLink{
                            NewsView()
                        } label: {
                            Label("News", systemImage: "newspaper")
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                            
                        }
                    }
                    ZStack{
                        Rectangle()
                            .frame(width: 350, height: 100)
                            .cornerRadius(40)
                            .foregroundStyle(Color(.lightGreen))
                        NavigationLink{
                            PipesView()
                        } label: {
                            Label("Pipes", systemImage: "pipe.and.drop")
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                            
                        }
                    }
                    .mask {
                        LinearGradient(gradient: Gradient(stops: [
                            .init(color: .clear, location: 0),
                            .init(color: .black, location: 0.05),
                            .init(color: .black, location: 0.95),
                            .init(color: .clear, location: 1)
                        ]), startPoint: .top, endPoint: .bottom)
                    }
            }
        }
    }
}

#Preview {
    NavigationView{
        CheckpointView()
    }
}
