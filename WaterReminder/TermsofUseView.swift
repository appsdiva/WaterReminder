//
//  TermsofUseView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 6/13/24.
//

import SwiftUI

struct TermsOfUseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Terms of Use")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 10)

//                Text("Last updated: [Date]")
//                    .italic()
//                    .padding(.bottom, 10)
                
                Text("Welcome to the Alarm App operated by AppsDevo LLC (\"us\", \"we\", or \"our\"). By downloading, accessing, or using our mobile application (the \"Service\"), you agree to be bound by these Terms of Use (\"Terms\"). If you do not agree with these Terms, please do not use the Service.")
                    .padding(.bottom, 10)

                Text("1. Acceptance of Terms")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("By using the Service, you agree to comply with and be legally bound by these Terms. These Terms apply to all visitors, users, and others who access or use the Service.")
                    .padding(.bottom, 10)
                
                Text("2. Changes to Terms")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("We reserve the right to modify these Terms at any time. We will notify you of any changes by posting the new Terms on the Service. Your continued use of the Service after the posting of changes constitutes your acceptance of such changes.")
                    .padding(.bottom, 10)
                
                Text("3. Use of the Service")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("**Eligibility:** You must be at least 18 years old to use the Service. By using the Service, you represent and warrant that you meet this age requirement.")
                    .padding(.bottom, 5)
                
                Text("**Account Creation:** To access certain features of the Service, you may need to create an account. You agree to provide accurate, current, and complete information during the registration process and to update such information as necessary.")
                    .padding(.bottom, 5)
                
                Text("**Account Security:** You are responsible for maintaining the confidentiality of your account password and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account.")
                    .padding(.bottom, 10)
                
                Text("4. Privacy Policy")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("Your use of the Service is also governed by our Privacy Policy. Please review our Privacy Policy to understand our practices regarding the collection, use, and disclosure of your personal data.")
                    .padding(.bottom, 10)
                
                Text("5. User Conduct")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("You agree not to use the Service for any unlawful purpose or in any way that could harm the Service, impair anyone else’s use of the Service, or violate these Terms. Prohibited activities include, but are not limited to:")
                    .padding(.bottom, 5)
                
                Text("• Using the Service to transmit any content that is unlawful, harmful, defamatory, or otherwise objectionable.\n• Interfering with the operation of the Service or the servers or networks used to make the Service available.\n• Attempting to gain unauthorized access to the Service or any part of it.")
                    .padding(.bottom, 10)
                
                Text("6. Intellectual Property")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("The Service and its original content, features, and functionality are and will remain the exclusive property of AppsDevo LLC and its licensors. The Service is protected by copyright, trademark, and other laws of both the United States and foreign countries.")
                    .padding(.bottom, 10)
                
                Text("7. Termination")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("We may terminate or suspend your account and bar access to the Service immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.")
                    .padding(.bottom, 10)
                
                Text("8. Limitation of Liability")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("To the maximum extent permitted by applicable law, in no event shall AppsDevo LLC, its affiliates, agents, directors, employees, suppliers, or licensors be liable for any indirect, incidental, special, consequential, or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses, resulting from:")
                    .padding(.bottom, 5)
                
                Text("• Your use of or inability to use the Service.\n• Any unauthorized access to or use of our servers and/or any personal information stored therein.\n• Any interruption or cessation of transmission to or from the Service.\n• Any bugs, viruses, trojan horses, or the like that may be transmitted to or through our Service by any third party.\n• Any errors or omissions in any content or for any loss or damage incurred as a result of the use of any content posted, emailed, transmitted, or otherwise made available through the Service.")
                    .padding(.bottom, 10)
                
                Text("9. Governing Law")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("These Terms shall be governed and construed in accordance with the laws of the State of [Your State], United States, without regard to its conflict of law provisions.")
                    .padding(.bottom, 10)
                
                Text("10. Contact Us")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("If you have any questions about these Terms, please contact us at:")
                    .padding(.bottom, 5)
                
                Text("AppsDevo LLC\nEmail: support@appsdevo.com")
                    .padding(.bottom, 10)
            }
            .padding()
        }
        .navigationBarTitle("Terms of Use", displayMode: .inline)
    }
}


#Preview {
    TermsOfUseView()
}
