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
            Spacer()
            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 51, height: 31)
                Circle()
                    .fill(thumbColor)
                    .frame(width: 29, height: 29)
                    .padding(.all, 1)
            }
            .onTapGesture { configuration.isOn.toggle() }
            Spacer()
        }
        .frame(width: 51, height: 31)
        .animation(Animation.linear(duration: 0.2), value: configuration.isOn)
    }
}

