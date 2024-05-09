//
//  ReminderView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 4/18/24.
//

import SwiftUI

struct ReminderView: View {
    @Binding var reminder: Reminder
    private var notificationManager = NotificationManager.shared
    
    // Explicit public initializer
        public init(reminder: Binding<Reminder>) {
            _reminder = reminder
        }
    
    let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    let alarmcolor = LinearGradient(gradient: Gradient(colors: [Color("darkblue"), Color("lightblue")]), startPoint: .bottom, endPoint: .top)
    
    var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    // Display the formatted time
                    Text(reminder.time, formatter: DateFormatter.timeFormatter)
                        .font(.system(size: 35, weight: .semibold))
                        .foregroundColor(.black)

                    Spacer()

                    // Toggle for turning the reminder on or off
                    Toggle(isOn: $reminder.isActive) {
                        Text(reminder.isActive ? "On" : "Off")
                            .foregroundColor(.gray)
                    }
                    .labelsHidden()
                    .onChange(of: reminder.isActive) { newValue in
                        if newValue {
                            notificationManager.scheduleNotification(for: reminder)
                        } else {
                            notificationManager.cancelNotification(for: reminder)
                        }
                    }
                    .toggleStyle(ColoredToggleStyle(onColor: .blue, offColor: .gray, thumbColor: .white))
                    .padding(.trailing)
                }

                // Days of the week - only show if set to repeat
                HStack {
                    ForEach(0..<daysOfWeek.count, id: \.self) { index in
                        if reminder.repeatDays[index] {
                            Text(daysOfWeek[index])
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 4)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }
                }

                // Three-dot icon for more options
                HStack {
                    Spacer()
                    Button(action: {
                        // Action for editing options
                    }) {
                        Image(systemName: "ellipsis")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                }
            }
            .padding()
            .background(Color.white.opacity(0.7))  // Top part background
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.blue, lineWidth: 2)
            )
            .background(Color("BottomColor").opacity(0.7))  // Different color for the bottom part
            .cornerRadius(16)
            .padding(.horizontal)
        }

//    var body: some View {
//        HStack {
//            Text("\(reminder.time, formatter: DateFormatter.itemFormatter)")
//                .font(.system(size: 35, weight: .semibold, design: .default))
//                .foregroundColor(.black)
//                .padding(.leading)
//            
//            Spacer()
//            
//            Toggle(isOn: $reminder.isActive) {
//                Text(reminder.isActive ? "On" : "Off")
//            }
//            .labelsHidden()
//            .onChange(of: reminder.isActive) { newValue in
//                if newValue {
//                    notificationManager.scheduleNotification(for: reminder)
//                } else {
//                    notificationManager.cancelNotification(for: reminder)
//                }
//            }
////            .toggleStyle(SwitchToggleStyle(tint: .black))
//            .toggleStyle(ColoredToggleStyle(onColor: .black, offColor: .gray, thumbColor: .white))
//                .padding(.trailing)
//        }
//        .padding(12)
//        .background(.white.opacity(0.7))
//    }
//    
   
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView(reminder: .constant(Reminder(time: Date(), isActive: true)))
    }
}


