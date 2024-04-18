//
//  ColoredToggleStyle.swift
//  WaterReminder
//
//  Created by Stacey Smith on 4/18/24.
//
import SwiftUI

struct ColoredToggleStyle: ToggleStyle {
    var onColor: Color
    var offColor: Color
    var thumbColor: Color

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            RoundedRectangle(cornerRadius: 16)
                .fill(configuration.isOn ? onColor : offColor)
                .frame(width: 51, height: 31)
                .overlay(
                    Circle()
                        .fill(thumbColor)
                        .padding(2)
                        .frame(width: 31, height: 31, alignment: configuration.isOn ? .trailing : .leading)
                        .animation(Animation.linear(duration: 0.1), value: configuration.isOn)
                )
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
