import SwiftUI

struct OaklavnMainMenu: View {
    @State private var showGame = false
    @State private var showShop = false
    @State private var showAchievement = false
    @State private var showMiniGames = false
    @State private var showSettings = false
    
    @StateObject var achievementVM = OaklavnAchievementsViewModel()
    @StateObject var settingsVM = OaklavnSettingsViewModel()
    @StateObject var shopVM = OaklavnStoreViewModel()
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 0) {
                HStack(alignment: .top) {
                    Button {
                        showSettings = true
                    } label: {
                        Image(.settingsIconOaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 180:90)
                    }
                    
                    Spacer()
                    
                    OaklavnCoinBg()
                    
                }
                
                
                Spacer()
                VStack {
                    Button {
                        showGame = true
                    } label: {
                        Image(.playIconOaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 300:150)
                    }
                    
                    Button {
                        showMiniGames = true
                    } label: {
                        Image(.miniGamesIconOaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:100)
                    }
                }
                Spacer()
                
                HStack(alignment: .bottom) {
                    
                    Button {
                        showShop = true
                    } label: {
                        Image(.shopIconOaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 280:140)
                    }
                    Spacer()
                    
                    Button {
                        showAchievement = true
                    } label: {
                        Image(.achievementsIconOaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 280:140)
                    }
                }
                
            }.padding()
                .ignoresSafeArea(edges: .bottom)
            
        }
        .background(
            ZStack {
                Image(.menuBgOaklavn)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            }
        )
//                    .onAppear {
//                        if settingsVM.musicEnabled {
//                            GEMusicManager.shared.playBackgroundMusic()
//                        }
//                    }
//                    .onChange(of: settingsVM.musicEnabled) { enabled in
//                        if enabled {
//                            GEMusicManager.shared.playBackgroundMusic()
//                        } else {
//                            GEMusicManager.shared.stopBackgroundMusic()
//                        }
//                    }
        .fullScreenCover(isPresented: $showGame) {
            ChooseLevelView(shopVM: shopVM, achievementVM: achievementVM)
        }
        .fullScreenCover(isPresented: $showMiniGames) {
            OaklavnChooseView()
        }
        .fullScreenCover(isPresented: $showAchievement) {
            OaklavnAchievementsView(viewModel: achievementVM)
        }
        .fullScreenCover(isPresented: $showShop) {
            OaklavnShopView(viewModel: shopVM)
        }
        .fullScreenCover(isPresented: $showSettings) {
            SettingsViewOaklavn(settingsVM: settingsVM)
        }
        
        
        
        
    }
    
}


#Preview {
    OaklavnMainMenu()
}
