//
//  SwiftUIView.swift
//  saveTheEarth
//
//  Created by T Krobot on 23/8/25.
//

import SwiftUI

struct CloudView: View {
    
    @State private var ShowClouds: Bool = false
    var body: some View {
        Image("Cloud")
            .transition(.slide)
    }
}

#Preview {
    CloudView()
}
