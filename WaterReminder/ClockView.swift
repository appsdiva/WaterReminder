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
//            Circle()
//                .stroke(lineWidth: 2)
//                .foregroundColor(Color.white.opacity(0.7))
//            
            // Minute markers
            ForEach(0..<60) { minute in
                Rectangle()
                    .fill(minute % 5 == 0 ? Color.white : Color.white.opacity(0.7)) // Longer and more opaque for every 5 minutes
                    .frame(width: minute % 5 == 0 ? 3 : 1, height: minute % 5 == 0 ? 18 : 8) // Bigger markers for every 5 minutes
                    .offset(y: -90) // Positioning at the edge of the clock face
                    .rotationEffect(.degrees(Double(minute) * 6)) // Rotating the marker to the correct position
            }
            
            // Hour hand
            Rectangle()
                .fill(Color.white)
                .frame(width: 4, height: 55)
                .offset(y: -25) // Start from the edge of the center circle
                .rotationEffect(.degrees(hourAngle()))
            
            // Minute hand
            Rectangle()
                .fill(Color.white)
                .frame(width: 1.5, height: 80)
                .offset(y: -35) // Start from the edge of the center circle
                .rotationEffect(.degrees(minuteAngle()))
            
            // Second hand
            Rectangle()
                .fill(Color.blue)
                .frame(width: 1, height: 100)
                .offset(y: -45) // Start from the edge of the center circle
                .rotationEffect(.degrees(secondAngle()))
            
            // Center circle
            Circle()
                .frame(width: 8, height: 8)
                .foregroundColor(.white)
//                .stroke(Color.white, lineWidth: 1)
//                .frame(width: 15, height: 15)
                .shadow(radius: 10)
        }
        .onReceive(timer) { input in
            self.currentDate = input
        }
        .frame(width: 250, height: 250) // Set the size of the clock face
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
        .preferredColorScheme(.dark)
}
