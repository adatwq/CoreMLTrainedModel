//
//  ViewModel.swift
//  CoreMLTrainedModel
//
//  Created by shahadmufleh on 02/03/2025.
//

import SwiftUI
import CoreML

class ImageClassifierViewModel: ObservableObject {
    
    @Published var classificationLabel: String = ""
    @Published var currentIndex: Int = 0
    
    private let photos = ["pineapple", "strawberry", "lemon", "Dog"]
    
    var currentImage: String {
        photos[currentIndex]
    }
    
    func previousImage() {
        currentIndex = currentIndex > 0 ? currentIndex - 1 : photos.count - 1
    }
    
    func nextImage() {
        currentIndex = (currentIndex + 1) % photos.count
    }
    
    func classifyImage() {
        guard let model = try? MobileNetV2(configuration: MLModelConfiguration()),
              let image = UIImage(named: currentImage)?.resizeImageTo(size: CGSize(width: 224, height: 224)),
              let buffer = image.convertToBuffer(),
              let output = try? model.prediction(image: buffer) else {
            classificationLabel = "Error: Classification failed"
            return
        }
        
        classificationLabel = output.classLabel
    }
}
