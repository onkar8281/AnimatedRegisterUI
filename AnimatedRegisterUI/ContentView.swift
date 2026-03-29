//
//  ContentView.swift
//  AnimatedRegisterUI
//
//  Created by Onkar Vaidya on 29/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RegisterView()
    }
}

#Preview {
    ContentView()
}


struct RegisterView: View {
    
    @State private var animateBG = false
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            
            // Animated Gradient Background
            LinearGradient(
                colors: [.black, .blue.opacity(0.6), .purple],
                startPoint: animateBG ? .topLeading : .bottomTrailing,
                endPoint: animateBG ? .bottomTrailing : .topLeading
            )
            .ignoresSafeArea()
            .animation(.easeInOut(duration: 6).repeatForever(), value: animateBG)
            
            // Spark Particles
            SparkView()
            
            // Glass Form
            VStack(spacing: 20) {
                
                Text("Create Account")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                
                Button(action: {}) {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .scaleEffect(1.0)
                }
                .padding(.top)
            }
            .padding()
        }
        .onAppear {
            animateBG = true
        }
    }
}


// MARK: - Spark Animation

struct SparkView: View {
    
    @State private var animate = false
    
    var body: some View {
        GeometryReader { geo in
            
            ForEach(0..<30) { i in
                Circle()
                    .fill(Color.white.opacity(0.7))
                    .frame(width: 4, height: 4)
                    .position(
                        x: CGFloat.random(in: 0...geo.size.width),
                        y: animate ? -10 : geo.size.height + 10
                    )
                    .animation(
                        .linear(duration: Double.random(in: 3...6))
                        .repeatForever(autoreverses: false)
                        .delay(Double(i) * 0.2),
                        value: animate
                    )
            }
        }
        .ignoresSafeArea()
        .onAppear {
            animate = true
        }
    }
}
