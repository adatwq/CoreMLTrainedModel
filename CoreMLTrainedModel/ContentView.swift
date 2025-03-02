//
//  ContentView.swift
//  CoreMLwithSwiftUI
//
//  Created by shahadmufleh on 20/02/2025.
//

import SwiftUI
import CoreML

struct ContentView: View {
   
    @State private var classificationLabel: String = ""
    
    let photos = ["pineapple", "strawberry", "lemon", "Dog"]
    @State private var currentIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Image(photos[currentIndex])
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(17)
            HStack {
                Button("Back") {
                    if self.currentIndex >= self.photos.count {
                        self.currentIndex = self.currentIndex - 1
                    } else {
                        self.currentIndex = 0
                    }
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.gray)
                .cornerRadius(17)

                Button("Next") {
                    if self.currentIndex < self.photos.count - 1 {
                        self.currentIndex = self.currentIndex + 1
                    } else {
                        self.currentIndex = 0
                    }
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.gray)
                .cornerRadius(17)
            }
            
            
            // The button we will use to classify the image using our model
            
            
            Button("Classify") {
                
                classifyImage()
            }
            .padding()
            .frame(width: 200, height: 60)
            
            .foregroundColor(Color.white)
            .background(Color.green)
            .cornerRadius(17)

            // The Text View that we will use to display the results of the classification
            
            
            Text(classificationLabel)
                .padding()
                .font(.body)
            Spacer()
        }
    }
    
    private func classifyImage() {
        
      
        
     
          
        //Step 1: Create an instance of our model
            
        let model = try? MobileNetV2(configuration: MLModelConfiguration())
            
        //Step 2: Create the input
        
        let currentImage = photos[currentIndex]
        
            //conver it to UIImage
        
        guard let image = UIImage(named: currentImage),  let resizedImage = image.resizeImageTo(size: CGSize(width: 224, height: 224)),
        
        let buffer = resizedImage.convertToBuffer() else{
            
            return
        }
            
       //Step 3: Get the results/output / predict the given input
        
        
        let output = try? model?.prediction(image: buffer)
        
        if let output = output{
            
            
            let result = output.classLabel
            
            
            
            self.classificationLabel = result
            
            
        }
        
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        //Take the current index, Convert our image into UIImage

        //then: resize our image(since the model expects a certain image size)
       //Convert the image into CoreVideo pixle buffer
        
        
        
        
        
            //take the output and assign it to the classLabel
            
           
            
          
             
        
        
        //assign results to our classficationLabel in the UI
        
        
       
    }
    
}

#Preview {
    ContentView()
}
