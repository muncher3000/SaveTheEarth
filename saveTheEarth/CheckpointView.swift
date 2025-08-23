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
                    Text("Checkpoints")
                        .bold()
                        .font(.largeTitle)
            }
            
            ScrollView{
                ZStack{
                    Rectangle()
                        .frame(width: 350, height: 100)
                        .cornerRadius(40)
                        .foregroundStyle(Color(.lightGreen))
                    Text("Acid Rain")
                        .font(.title)
                        .bold()
                    
                }
                .padding(.top)
                ZStack{
                    Rectangle()
                        .frame(width: 350, height: 100)
                        .cornerRadius(40)
                        .foregroundStyle(Color(.lightBlue))
                    Text("Catch Foam")
                        .font(.title)
                        .bold()
                    
                }
                ZStack{
                    Rectangle()
                        .frame(width: 350, height: 100)
                        .cornerRadius(40)
                        .foregroundStyle(Color(.lightGreen))
                    Text("Incinerator")
                        .font(.title)
                        .bold()
                    
                }
                ZStack{
                    Rectangle()
                        .frame(width: 350, height: 100)
                        .cornerRadius(40)
                        .foregroundStyle(Color(.lightBlue))
                    Text("News")
                        .font(.title)
                        .bold()
                    
                }
                ZStack{
                    Rectangle()
                        .frame(width: 350, height: 100)
                        .cornerRadius(40)
                        .foregroundStyle(Color(.lightGreen))
                    Text("Pipes")
                        .font(.title)
                        .bold()
                    
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

#Preview {
    CheckpointView()
}
