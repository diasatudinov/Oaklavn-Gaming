import SwiftUI
import SpriteKit

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
   
    @State var gameScene: GameScene = {
        let scene = GameScene(size: UIScreen.main.bounds.size)
        scene.scaleMode = .resizeFill
        return scene
    }()
    @ObservedObject var shopVM: OaklavnStoreViewModel
    @ObservedObject var achievementVM: OaklavnAchievementsViewModel
    @State private var powerUse = false
    @State private var isWin = false
    @State private var score = 0
    @State var level: Int
    var imagesForView: [String] = ["viewImage1Oaklavn","viewImage2Oaklavn","viewImage3Oaklavn","viewImage4Oaklavn","viewImage5Oaklavn", "viewImage6Oaklavn", "viewImage7Oaklavn", ""]
    var body: some View {
        ZStack {
            SpriteViewContainer(scene: gameScene, isWin: $isWin, score: $score, level: level)
                .ignoresSafeArea()
            
            VStack(spacing: OaklavnDeviceManager.shared.deviceType == .pad ? 200:100) {
                HStack(spacing: OaklavnDeviceManager.shared.deviceType == .pad ? 200:100) {
                    ZStack {
                        Image(.rectMainGameOaklavn)
                            .resizable()
                            .scaledToFit()
                        
                        Image(imagesForView[Int.random(in: Range(0...imagesForView.count - 1))])
                            .resizable()
                            .scaledToFit()
                            .padding()
                            
                        
                    }
                    .frame(width: OaklavnDeviceManager.shared.deviceType == .pad ? 280:140,height: OaklavnDeviceManager.shared.deviceType == .pad ? 400:200)
                    
                    ZStack {
                        Image(.rectMainGameOaklavn)
                            .resizable()
                            .scaledToFit()
                        
                        Image(imagesForView[Int.random(in: Range(0...imagesForView.count - 1))])
                            .resizable()
                            .scaledToFit()
                            .padding()
                            
                        
                    }
                    .frame(width: OaklavnDeviceManager.shared.deviceType == .pad ? 280:140,height: OaklavnDeviceManager.shared.deviceType == .pad ? 400:200)
                }
                
                HStack(spacing: OaklavnDeviceManager.shared.deviceType == .pad ? 200:100) {
                    ZStack {
                        Image(.rectMainGameOaklavn)
                            .resizable()
                            .scaledToFit()
                        
                        Image(imagesForView[Int.random(in: Range(0...imagesForView.count - 1))])
                            .resizable()
                            .scaledToFit()
                            .padding()
                            
                        
                    }
                    .frame(width: OaklavnDeviceManager.shared.deviceType == .pad ? 280: 140,height: OaklavnDeviceManager.shared.deviceType == .pad ? 400:200)
                    
                    ZStack {
                        Image(.rectMainGameOaklavn)
                            .resizable()
                            .scaledToFit()
                        
                        Image(imagesForView[Int.random(in: Range(0...imagesForView.count - 1))])
                            .resizable()
                            .scaledToFit()
                            .padding()
                            
                        
                    }
                    .frame(width: OaklavnDeviceManager.shared.deviceType == .pad ? 280:140,height: OaklavnDeviceManager.shared.deviceType == .pad ? 400:200)
                }
            }
            
            VStack {
                HStack {
                    HStack(alignment: .top) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                            
                        } label: {
                            Image(.backIconOaklavn)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                        }
                        Spacer()
                        
                        
                        Button {
                            gameScene.restartLevel()
                            isWin = false
                        } label: {
                            Image(.restartBtnOaklavn)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                        }
                    }.padding([.horizontal, .top])
                }
                
                Spacer()
            }
            
            if isWin {
                ZStack {
                    Image(.gameOverBgOaklavn)
                        .resizable()
                        .ignoresSafeArea()
                    VStack(spacing: -40) {
                        Image(.winBoardOaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 800:400)
                        
                        HStack {
                            
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(.homeBtnOaklavn)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:100)
                            }
                            Button {
                                gameScene.restartLevel()
                                isWin = false
                            } label: {
                                Image(.nextBtnOaklavn)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:100)
                            }
                        }
                    }
                }
            }
            
        }.background(
            ZStack {
                Image(.mainGameBgOaklavn)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                
            }
        )
    }
}

#Preview {
    GameView(shopVM: OaklavnStoreViewModel(), achievementVM: OaklavnAchievementsViewModel(), level: 0)
}
