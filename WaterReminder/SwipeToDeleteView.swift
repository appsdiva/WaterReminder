//
//  SwipeToDeleteView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 5/10/24.
//

import SwiftUI

struct SwipeToDeleteView: View {
    @ObservedObject var alarmManager: AlarmManager
    var alarm: Alarm
    var onDelete: () -> Void
    @State private var offset = CGSize.zero
    @State private var isVisible = true  // State to control visibility
    
    //    public init(alarm: Binding<Alarm>) {
    //        _alarm = alarm
    //    }
    
    var body: some View {
            if isVisible {
                HStack {
                    AlarmRow(alarm: alarm)
                    Spacer()
                }
                .frame(height: 60)
                .padding(.horizontal)
                .background(Color.clear)
                .opacity(isVisible ? 1 : 0)
                .offset(x: offset.width, y: 0)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            if gesture.translation.width < 0 {
                                self.offset = gesture.translation
                            }
                        }
                        .onEnded { gesture in
                            if gesture.translation.width < -100 {
                                withAnimation {
                                    self.isVisible = false
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                    self.onDelete()
                                }
                            } else {
                                withAnimation {
                                    self.offset = .zero
                                }
                            }
                        }
                )
            }
        }
}
