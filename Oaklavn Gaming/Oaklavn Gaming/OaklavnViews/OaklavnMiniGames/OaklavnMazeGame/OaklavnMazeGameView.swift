import SwiftUI
import SpriteKit

struct OaklavnMazeGameView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var isWin = false
    @State private var gameScene: MazeScene = {
        let scene = MazeScene(size: UIScreen.main.bounds.size)
        scene.scaleMode = .resizeFill
        return scene
    }()
    
    @State private var powerUse = false
    
    var body: some View {
        ZStack {
            LabirintViewContainer(scene: gameScene, isWin: $isWin)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    HStack(alignment: .top) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                            
                        } label: {
                            Image(.backIconOaklavn)
                                .resizable()
                                .scaledToFit()
                                .frame(height: SGDeviceManager.shared.deviceType == .pad ? 100:50)
                        }
                        Spacer()
                        Image(.mazeTextOaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: SGDeviceManager.shared.deviceType == .pad ? 300:150)
                        Spacer()

                    }.padding([.horizontal, .top])
                }
                
                Spacer()
                ZStack {
                    Image(.arrowBgOaklavn)
                        .resizable()
                        .scaledToFit()
                        .frame(height: SGDeviceManager.shared.deviceType == .pad ? 300:150)
                    VStack(spacing: 0) {
                        Button {
                            gameScene.moveUp()
                            
                        } label: {
                            Image(.controlArrowOaklavn)
                                .resizable()
                                .scaledToFit()
                                .frame(height: SGDeviceManager.shared.deviceType == .pad ? 100:50)
                        }
                        HStack(spacing: SGDeviceManager.shared.deviceType == .pad ? 100:50) {
                            Button {
                                gameScene.moveLeft()
                            } label: {
                                Image(.controlArrowOaklavn)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: SGDeviceManager.shared.deviceType == .pad ? 100:50)
                                    .rotationEffect(.degrees(90))
                                    .scaleEffect(x: -1, y: 1)
                            }
                            
                            Button {
                                gameScene.moveRight()
                            } label: {
                                Image(.controlArrowOaklavn)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: SGDeviceManager.shared.deviceType == .pad ? 100:50)
                                    .rotationEffect(.degrees(90))
                            }
                        }
                        
                        Button {
                            gameScene.moveDown()
                        } label: {
                            Image(.controlArrowOaklavn)
                                .resizable()
                                .scaledToFit()
                                .frame(height: SGDeviceManager.shared.deviceType == .pad ? 100:50)
                                .scaleEffect(x: 1, y: -1)
                        }
                    }
                }
                
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
                            .frame(height: SGDeviceManager.shared.deviceType == .pad ? 800:400)
                        
                        HStack {
                            
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(.homeBtnOaklavn)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: SGDeviceManager.shared.deviceType == .pad ? 200:100)
                            }
                            Button {
                                gameScene.restartGame()
                                isWin = false
                            } label: {
                                Image(.nextBtnOaklavn)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: SGDeviceManager.shared.deviceType == .pad ? 200:100)
                            }
                        }
                    }
                }
            }
            
        }.background(
            ZStack {
                Image(.mazeViewBgOaklavn)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            }
        )
    }
}

#Preview {
    OaklavnMazeGameView()
}
