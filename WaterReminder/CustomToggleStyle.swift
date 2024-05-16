//
//  CustomToggleStyle.swift
//  WaterReminder
//
//  Created by Stacey Smith on 5/16/24.
//
import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(configuration.isOn ? Color("middleblue") : Color.gray)
                    .frame(width: 51, height: 31)
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 27, height: 27)
                    .offset(x: configuration.isOn ? 10 : -10)
                    //.animation(nil) // Disable default animation
            }
            .onTapGesture {
                    configuration.isOn.toggle()
            }
        }
    }
}
