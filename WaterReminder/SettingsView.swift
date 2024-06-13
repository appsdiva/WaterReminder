//
//  SettingsView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 5/16/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var showingShareSheet = false
    let gradient = LinearGradient(gradient: Gradient(colors: [Color("darkblue"), Color("lightblue")]), startPoint: .bottomTrailing, endPoint: .topLeading)
    let appURL = URL(string: "https://apps.apple.com/app/idYOUR_APP_ID")! // Replace "YOUR_APP_ID" with actual App Store ID
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("lightblue"))]
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: ContactUsView()) {
                        HStack {
                            Image(systemName: "envelope")
                            Text("Contact us")
                        }
                    }
//                    NavigationLink(destination: NotificationSettingsView()) {
//                        HStack {
//                            Image(systemName: "gear")
//                            Text("Notification Settings")
//                        }
//                    }
//                    NavigationLink(destination: RateAppView()) {
//                        HStack {
//                            Image(systemName: "heart")
//                            Text("Rate the app")
//                        }
//                    }
                    Button(action: {
                                        showingShareSheet = true
                                    }) {
                                        HStack {
                                            Image(systemName: "square.and.arrow.up")
                                            Text("Share the app")
                                        }
                                        .foregroundColor(.black)
                                    }
                                    .sheet(isPresented: $showingShareSheet) {
                                        ShareSheet(items: [appURL])
                                    }
//                    NavigationLink(destination: AboutUsView()) {
//                        HStack {
//                            Image(systemName: "globe")
//                            Text("About us")
//                        }
//                    }
                    NavigationLink(destination: SupportUsView()) {
                        HStack {
                            Image(systemName: "questionmark.circle")
                            Text("Give us a tip")
                        }
                    }
                }
                Section {
                    NavigationLink(destination: TermsOfUseView()) {
                        HStack {
                            Image(systemName: "doc.text")
                            Text("Terms of Use")
                        }
                    }
                    NavigationLink(destination: PrivacyPolicyView()) {
                        HStack {
                            Image(systemName: "shield")
                            Text("Privacy Policy")
                        }
                    }
                }
                Section {
                    Text("Water Reminder - Version 1.0")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .navigationBarTitle("Settings")
            //.foregroundColor(Color("middleblue"))
            //.background(gradient)
            .scrollContentBackground(.hidden)
        }
    }
}

struct ContactUsView: View {
    var body: some View {
        Text("Contact Us")
    }
}

struct NotificationSettingsView: View {
    var body: some View {
        Text("Notifications settings")
    }
}

struct RateAppView: View {
    var body: some View {
        Text("Rate the App")
    }
}

struct ShareAppView: View {
    var body: some View {
        Text("Share the App")
    }
}

struct AboutUsView: View {
    var body: some View {
        Text("About Us")
    }
}

struct SupportUsView: View {
    var body: some View {
        Text("Support Us")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


//#Preview {
//    SettingsView()
//}
