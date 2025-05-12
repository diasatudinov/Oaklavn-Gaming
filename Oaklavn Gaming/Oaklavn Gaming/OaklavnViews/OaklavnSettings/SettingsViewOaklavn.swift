import SwiftUI
import StoreKit

struct SettingsViewOaklavn: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var settingsVM: SettingsViewModelSG
    var body: some View {
        ZStack {
            
            ZStack {
                Image(.settingsBgOaklavn)
                    .resizable()
                    .scaledToFit()
                
                VStack(spacing: 30) {
                    
                    
                    HStack {
                        Image(.soundIconOaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 140:70)
                        VStack {
                            Image(.soundTextOaklavn)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 70:35)
                            HStack {
                                
                                Image(.minTextOaklavn)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 20:10)
                                Button {
                                    withAnimation {
                                        settingsVM.soundEnabled.toggle()
                                    }
                                } label: {
                                    
                                    Image(settingsVM.soundEnabled ? .onOaklavn:.offOaklavn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 50:25)
                                }
                                Image(.maxTextOaklavn)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 20:10)
                                
                            }
                        }
                    }
                    
                    HStack {
                        Image(.musicIconOaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 140:70)
                        VStack {
                            Image(.musicTextOaklavn)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 70:35)
                            
                            HStack {
                                
                                Image(.minTextOaklavn)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 20:10)
                                Button {
                                    withAnimation {
                                        settingsVM.musicEnabled.toggle()
                                    }
                                } label: {
                                    
                                    Image(settingsVM.musicEnabled ? .onOaklavn:.offOaklavn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 50:25)
                                }
                                Image(.maxTextOaklavn)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 20:10)
                            }
                        }
                    }
                    
                    HStack {
                        Image(.vibraIconOaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 140:70)
                        VStack {
                            Image(.vibrationTextOaklavn)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 70:35)
                            
                            HStack {
                                Image(.minTextOaklavn)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 20:10)
                                
                                Button {
                                    withAnimation {
                                        settingsVM.vibraEnabled.toggle()
                                    }
                                } label: {
                                    
                                    Image(settingsVM.vibraEnabled ? .onOaklavn:.offOaklavn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 50:25)
                                }
                                
                                Image(.maxTextOaklavn)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 20:10)
                            }
                        }
                    }
                    
                    
                }
                
                
            }.frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 1000:500)
            
            VStack {
                HStack {
                    HStack(alignment: .top) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                            
                        } label: {
                            Image(.backIconOaklavn)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 150:75)
                        }
                        Spacer()
                       
                    }.padding([.horizontal, .top])
                }
                Spacer()
            }
        }.background(
            ZStack {
                Image(.settingsViewBgOaklavn)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            }
        )
    }
    
    func rateUs() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}

#Preview {
    SettingsViewOaklavn(settingsVM: SettingsViewModelSG())
}
