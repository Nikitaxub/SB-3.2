//
//  ColorTextValueView.swift
//  RGBsliders
//
//  Created by xubuntus on 24.01.2022.
//

import SwiftUI

struct ColorTextValueView: View {
    @Binding var value: Double
    
    var body: some View {
        TextField("",
                  text: $value.textValue
                  )
            .textFieldStyle(.roundedBorder)
            .frame(width: 50)
            .multilineTextAlignment(.trailing)
            .keyboardType(.numberPad)
    }
}

extension Double {
    var textValue: String {
        get { "\(Int(self))" }
        set {
            if newValue == "" {
                self = 0
            } else {
                if let textValueRaw = Double(newValue) {
                    self = textValueRaw > 255 ? 255 : textValueRaw
                }
            }
        }
    }
}

struct ColorTextValueView_Previews: PreviewProvider {
    static var previews: some View {
        ColorTextValueView(value: .constant(127))
    }
}
