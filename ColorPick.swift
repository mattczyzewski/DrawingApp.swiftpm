//
//  ColorPick.swift
//  DrawingApp
//
//  Created by Subham Pathak on 5/2/23.
//
import SwiftUI

struct ColorPickerView: View {
    
    let colors = [Color.red, Color.orange, Color.green, Color.blue, Color.white, Color.purple, Color.pink, Color.black]
    
    @Binding var selectedColor: Color
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) {color in
                Image(systemName: selectedColor == color ? Constants.Icons.recordCircleFill : Constants.Icons.circleFill)
                    .foregroundColor(color)
                    .font(.system(size:16))
                    .clipShape(Circle())
                    .onTapGesture{
                        selectedColor = color
                        
                    }
            }
        }
    }
}
