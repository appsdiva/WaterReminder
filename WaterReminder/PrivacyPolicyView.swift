//
//  PrivacyPolicyView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 6/13/24.
//

import SwiftUI

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Privacy Policy")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 10)

                Text("AppsDevo LLC (\"us\", \"we\", or \"our\") operates the mobile application (the \"Service\"). This page informs you of our policies regarding the collection, use, and disclosure of personal data when you use our Service and the choices you have associated with that data.")
                    .padding(.bottom, 10)
                
                Text("We use your data to provide and improve the Service. By using the Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise defined in this Privacy Policy, terms used in this Privacy Policy have the same meanings as in our Terms and Conditions.")
                    .padding(.bottom, 10)
                
                Text("Information Collection and Use")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("We collect several different types of information for various purposes to provide and improve our Service to you.")
                    .padding(.bottom, 10)
                
                Text("Types of Data Collected")
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("Personal Data")
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you (\"Personal Data\"). Personally identifiable information may include, but is not limited to:")
                    .padding(.bottom, 5)
                
                Text("• Cookies and Usage Data")
                    .padding(.bottom, 10)
                
                Text("Usage Data")
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("When you access the Service by or through a mobile device, we may collect certain information automatically, including, but not limited to, the type of mobile device you use, your mobile device unique ID, the IP address of your mobile device, your mobile operating system, the type of mobile Internet browser you use, unique device identifiers and other diagnostic data (\"Usage Data\").")
                    .padding(.bottom, 10)
                
                Text("Tracking & Cookies Data")
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("We use cookies and similar tracking technologies to track the activity on our Service and hold certain information. Cookies are files with small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Tracking technologies also used are beacons, tags, and scripts to collect and track information and to improve and analyze our Service.")
                    .padding(.bottom, 5)
                
                Text("You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service.")
                    .padding(.bottom, 5)
                
                Text("Examples of Cookies we use:")
                    .padding(.bottom, 5)
                
                Text("• Session Cookies. We use Session Cookies to operate our Service.\n• Preference Cookies. We use Preference Cookies to remember your preferences and various settings.\n• Security Cookies. We use Security Cookies for security purposes.")
                    .padding(.bottom, 10)
                
                Text("Use of Data")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("AppsDevo LLC uses the collected data for various purposes:")
                    .padding(.bottom, 5)
                
                Text("• To provide and maintain the Service\n• To notify you about changes to our Service\n• To allow you to participate in interactive features of our Service when you choose to do so\n• To provide customer care and support\n• To provide analysis or valuable information so that we can improve the Service\n• To monitor the usage of the Service\n• To detect, prevent and address technical issues")
                    .padding(.bottom, 10)
                
                Text("We do not sell data to third parties.")
                    .padding(.bottom, 10)
                
                Text("Transfer of Data")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("Your information, including Personal Data, may be transferred and maintained on computers located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from your jurisdiction. If you are located outside United States and choose to provide information to us, please note that we transfer the data, to the United States and process it there. Your consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer.")
                    .padding(.bottom, 10)
                
                Text("AppsDevo LLC will take all steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy and no transfer of your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of your data and other personal information.")
                    .padding(.bottom, 10)
                
                Text("Disclosure of Data")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("Legal Requirements")
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("AppsDevo LLC may disclose your Personal Data in the good faith belief that such action is necessary to:")
                    .padding(.bottom, 5)
                
                Text("• To comply with a legal obligation\n• To protect and defend the rights or property of AppsDevo LLC\n• To prevent or investigate possible wrongdoing in connection with the Service\n• To protect the personal safety of users of the Service or the public\n• To protect against legal liability")
                    .padding(.bottom, 10)
                
                Text("Security of Data")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("The security of your data is important to us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security.")
                    .padding(.bottom, 10)
                
                Text("Service Providers")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("We may employ third party companies and individuals to facilitate our Service (\"Service Providers\"), to provide the Service on our behalf, to perform Service-related services or to assist us in analyzing how our Service is used. These third parties have access to your Personal Data only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.")
                    .padding(.bottom, 10)
                
                Text("Links To Other Sites")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("Our Service may contain links to other sites that are not operated by us. If you click on a third party link, you will be directed to that third party's site. We strongly advise you to review the Privacy Policy of every site you visit. We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.")
                    .padding(.bottom, 10)
                
                Text("Children's Privacy")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("Our Service does not address anyone under the age of 18 (\"Children\").")
                    .padding(.bottom, 10)
            }
            .padding()
        }
        .navigationBarTitle("Privacy Policy", displayMode: .inline)
    }
}


#Preview {
    PrivacyPolicyView()
}
