//
//  SwipeToDeleteView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 5/10/24.
//

import SwiftUI

struct SwipeToDeleteView: View {
    var alarm: Alarm
    var onDelete: () -> Void
    @State private var offset = CGSize.zero

    var body: some View {
        HStack {
            AlarmRow(alarm: alarm)
            Spacer()
        }
        .frame(height: 60)
        .padding(.horizontal)
        .background(Color.clear) // You can set any color
        //.cornerRadius(10)
        //.shadow(radius: 2) // Optional for better UI
        .offset(x: offset.width, y: 0)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    if gesture.translation.width < 0 {  // Only allow swiping to left
                        self.offset = gesture.translation
                    }
                }
                .onEnded { gesture in
                    if gesture.translation.width < -100 {  // Threshold to trigger deletion
                        self.onDelete()
                    }
                    self.offset = .zero  // Reset offset after swipe
                }
        )
    }
}
