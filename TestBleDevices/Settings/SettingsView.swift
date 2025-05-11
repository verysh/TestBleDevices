//

import SwiftUI

struct SettingsView: View {
    
    
    @ObservedObject var viewModel: SettingsCoordinatorViewModel
    
    @State var isWifiEnabled: Bool = false
    @State var isBleEnabled: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Group {
                    HStack{
                        Spacer()
                        VStack {
                            Image(uiImage: UIImage(named: "user")!)
                                .resizable()
                                .frame(width:100, height: 100, alignment: .center)
                            Text("User")
                                .font(.title)
                            Text("myname@gmail.com")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Button(action: {
                                print("Edit Profile tapped")
                            }) {
                                Text("Edit Profile")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .font(.system(size: 18))
                                    .padding()
                                    .foregroundColor(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            .background(Color.blue)
                            .cornerRadius(25)
                        }
                        Spacer()
                    }
                }
                
                Section(header: Text("PREFRENCES"), content: {
                    HStack{
                        Image(uiImage: UIImage(named: "Language")!)
                        Text("Language")
                    }
                    HStack{
                        Image(uiImage: UIImage(named: "wiFi-Icon")!)
                        Toggle(isOn: $isWifiEnabled) {
                            Text("is Wi-Fi enabled")
                        }
                    }
                })
            }
            .navigationBarTitle("Settings")
        }
        
    }
}
