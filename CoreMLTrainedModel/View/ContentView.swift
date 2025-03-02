//
//  ContentView.swift
//  CoreMLwithSwiftUI
//
//  Created by shahadmufleh on 20/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ImageClassifierViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            Image(viewModel.currentImage)
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(17)
            
            HStack {
                Button("Back", action: viewModel.previousImage)
                    .buttonStyle(CustomButtonStyle())
                
                Button("Next", action: viewModel.nextImage)
                    .buttonStyle(CustomButtonStyle())
            }
            
            Button("Classify", action: viewModel.classifyImage)
                .buttonStyle(YellowButtonStyle())
                .frame(width: 200, height: 60)
            
            Text(viewModel.classificationLabel)
                .padding()
                .font(.body)
            
            Spacer()
        }
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(17)
    }
}

struct YellowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(Color.yellow)
            .cornerRadius(17)
    }
}

#Preview {
    ContentView()
}
