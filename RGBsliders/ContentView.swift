//
//  ContentView.swift
//  RGBsliders
//
//  Created by xubuntus on 24.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue: Double = 127
    @State private var greenValue: Double = 127
    @State private var blueValue: Double = 127
    
    private let width = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            Color(.orange)
                .ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(.white, lineWidth: 3))
                    .padding(.horizontal)
                    .frame(height: width / 3)
                .foregroundColor(Color(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255))
                .padding(.bottom, 50)
                ColorValueView(value: $redValue, color: .red)
                ColorValueView(value: $greenValue, color: .green)
                ColorValueView(value: $blueValue, color: .blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorValueView: View {
    @Binding var value: Double
    let color: Color

    var body: some View {
        HStack {
            Text(value.textValue)
                .foregroundColor(.white)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
            ColorTextValueView(value: $value)
        }
        .padding(.horizontal)
    }
}
