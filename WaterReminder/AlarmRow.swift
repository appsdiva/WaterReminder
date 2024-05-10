//
//  AlarmRow.swift
//  WaterReminder
//
//  Created by Stacey Smith on 5/10/24.
//

import SwiftUI

struct AlarmRow: View {
    var time: String
    var isAM: Bool
    var isActive: Bool
    
    var body: some View {
        HStack {
            Text(time)
                .font(.system(size: 35, weight: .semibold))
                .foregroundColor(isActive ? .white : .gray)
            Spacer()
            Text(isAM ? "AM" : "PM")
                .foregroundColor(.white)
                .opacity(0.7)
            Toggle("", isOn: .constant(isActive))
                .toggleStyle(SwitchToggleStyle(tint: Color("darkblue")))
        }
        .padding(.horizontal)
    }
}


#Preview {
    AlarmRow(time: "7:00", isAM: true, isActive: false)
}
