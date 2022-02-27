//
//  UiSlider.swift
//  UiKitToSwiftUI
//
//  Created by Михаил Зверьков on 27.02.2022.
//

import SwiftUI

struct TargetSlider: UIViewRepresentable {
    
    @Binding var sliderValue: Int
    var transparency: Int
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.endEditing),
            for: .allEvents
        )
    
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
        uiView.thumbTintColor = UIColor(
            red: 1,
            green: 0,
            blue: 0,
            alpha: CGFloat(Float(transparency) / 100)
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue, transparency: transparency)
    }
}

extension TargetSlider {
    class Coordinator: NSObject {
        @Binding var sliderValue: Int
        var transparency: Int
        
        init(sliderValue: Binding<Int>, transparency: Int) {
            self._sliderValue = sliderValue
            self.transparency = transparency
        }
        
        @objc func endEditing(_ sender: UISlider) {
            sliderValue = Int(sender.value)
        }
    }
}

struct UiSlider_Previews: PreviewProvider {
    static var previews: some View {
        TargetSlider(sliderValue: .constant(90), transparency: 50)
    }
}
