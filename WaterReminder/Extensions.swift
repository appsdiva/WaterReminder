//
//  Extensions.swift
//  WaterReminder
//
//  Created by Stacey Smith on 6/13/24.
//
import StoreKit

extension SKProduct {
    var localizedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = self.priceLocale
        return formatter.string(from: self.price) ?? "$\(self.price)"
    }
}

