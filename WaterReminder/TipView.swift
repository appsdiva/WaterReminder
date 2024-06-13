//
//  TipView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 6/13/24.
//
import SwiftUI

struct TipView: View {
    @ObservedObject var storeManager: StoreManager  
    // Assumes you have a StoreManager class handling transactions
    
    var body: some View {
        VStack {
            Image("HighFive")  // Make sure to add this image to your assets
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Text("Please support us!")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Text("The app is free even though it costs us money to run. If it made you smile, please consider supporting us!")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            VStack(spacing: 20) {
                ForEach(storeManager.products, id: \.self) { product in
                    Button(action: {
                        storeManager.buyProduct(product)
                    }) {
                        HStack {
                            Image(systemName: productIcon(product: product))
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            Text("\(product.localizedPrice) \(product.localizedTitle)")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(15)
                    }
                }
            }
            .padding()
        }
    }
    
    func productIcon(product: SKProduct) -> String {
        switch product.productIdentifier {
        case "com.yourapp.smallTip":
            return "cup.and.saucer"
        case "com.yourapp.mediumTip":
            return "cup.and.saucer.fill"
        case "com.yourapp.largeTip":
            return "cart.fill"
        default:
            return "heart"
        }
    }
}

//
//#Preview {
//    TipView()
//}
