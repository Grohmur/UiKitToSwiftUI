//
//  ContentView.swift
//  UiKitToSwiftUI
//
//  Created by Михаил Зверьков on 27.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var target = Int.random(in: 0...100)
    @State private var sliderValue = 50
    @State private var points = 100
    @State private var alertIsPresented = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер как можно ближе к \(target)")
                .font(.callout)
                .padding()
            HStack {
                Text("0")
                TargetSlider(sliderValue: $sliderValue, transparency: computeScore())
                Text("100")
            }
            .padding()
            Button("Проверь меня") {
                points = computeScore()
                alertIsPresented.toggle()
            }.alert(
                "Your score \(points)",
                isPresented: $alertIsPresented,
                actions: {}
            )
            Button {
                target = Int.random(in: 0...100)
            } label: {
                Text("Начать заново")
            }
        }
    }
}


extension ContentView {
    
    private func computeScore() -> Int {
        let difference = abs(target - lround(Double(sliderValue)))
        return 100 - difference
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
