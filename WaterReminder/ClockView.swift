//
//  ClockView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 5/10/24.
//

import SwiftUI

struct ClockView: View {
    @State private var currentDate = Date() // Tracks the current date and time
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // Timer to update every second
    
    var body: some View {
        ZStack {
            // Clock face
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(Color.white.opacity(0.7))
            
            // Hour hand
            Rectangle()
                .fill(Color.white)
                .frame(width: 3, height: 50)
                .offset(y: -25)
                .rotationEffect(.degrees(hourAngle()))
            
            // Minute hand
            Rectangle()
                .fill(Color.white)
                .frame(width: 2, height: 70)
                .offset(y: -35)
                .rotationEffect(.degrees(minuteAngle()))
            
            // Second hand
            Rectangle()
                .fill(Color.red) // Typically the second hand is red
                .frame(width: 1, height: 90)
                .offset(y: -45)
                .rotationEffect(.degrees(secondAngle()))
            
            // Center circle
            Circle()
                .frame(width: 10, height: 10)
                .foregroundColor(.white)
        }
        .onReceive(timer) { input in
            self.currentDate = input
        }
        .frame(width: 200, height: 200) // Set the size of the clock face
    }
    
    // Calculate rotation for the hour hand
    private func hourAngle() -> Double {
        let hour = Double(Calendar.current.component(.hour, from: currentDate) % 12)
        let minute = Double(Calendar.current.component(.minute, from: currentDate))
        return (hour + minute / 60) * 30 // 360 / 12 = 30 degrees per hour
    }
    
    // Calculate rotation for the minute hand
    private func minuteAngle() -> Double {
        let minute = Double(Calendar.current.component(.minute, from: currentDate))
        let second = Double(Calendar.current.component(.second, from: currentDate))
        return (minute + second / 60) * 6 // 360 / 60 = 6 degrees per minute
    }
    
    // Calculate rotation for the second hand
    private func secondAngle() -> Double {
        let second = Double(Calendar.current.component(.second, from: currentDate))
        return second * 6 // 360 / 60 = 6 degrees per second
    }
}

#Preview {
    ClockView()
}
