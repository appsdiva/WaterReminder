//
//  VerticleEllipsisIcon.swift
//  WaterReminder
//
//  Created by Stacey Smith on 5/10/24.
//

import SwiftUI

struct VerticalEllipsisIcon: View {
    var body: some View {
        VStack(spacing: 3) {
            ForEach(0..<3, id: \.self) { _ in
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    VerticleEllipsisIcon()
}
