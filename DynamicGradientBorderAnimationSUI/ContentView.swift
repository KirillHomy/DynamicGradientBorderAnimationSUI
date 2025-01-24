//
//  ContentView.swift
//  DynamicGradientBorderAnimationSUI
//
//  Created by Kirill Khomicevich on 24.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var rotationAngle: CGFloat = .zero
    var body: some View {
        ZStack {
            Color.gray
            // Main view
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 260, height: 440)
                .foregroundStyle(Color.black)
                .shadow(color: .purple, radius: 10, x: 0, y: 5)
            
            // Border
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 130, height: 500)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.yellow,
                                                                            Color.blue]),
                                                startPoint: .top,
                                                endPoint: .bottom))
                .rotationEffect(.degrees(rotationAngle))
            // Mask for border
                .mask {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(lineWidth: 5)
                        .frame(width: 257, height: 437)
                }
            Text("CAROUSEL")
                .bold()
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                rotationAngle = 360
            }
        }
    }
}

#Preview {
    ContentView()
}
