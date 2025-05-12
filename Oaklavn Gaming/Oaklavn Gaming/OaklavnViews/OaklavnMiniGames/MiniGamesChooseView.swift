import SwiftUI

struct OaklavnChooseView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var game1 = false
    @State private var game2 = false
    @State private var game3 = false
    @State private var game4 = false
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    HStack(alignment: .top) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                            
                        } label: {
                            Image(.backIconOaklavn)
                                .resizable()
                                .scaledToFit()
                                .frame(height: SGDeviceManager.shared.deviceType == .pad ? 150:75)
                        }
                        Spacer()
                    }.padding([.horizontal, .top])
                }
                
                Image(.chooseGameTextOaklavn)
                    .resizable()
                    .scaledToFit()
                    .frame(height: SGDeviceManager.shared.deviceType == .pad ? 150:75)
                
                VStack {
                    Button {
                        game1 = true
                    } label: {
                        Image(.game1Oaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: SGDeviceManager.shared.deviceType == .pad ? 200:100)
                            
                          
                    }.offset(x: -25)
                    
                    Button {
                        game2 = true
                    } label: {
                        Image(.game2Oaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: SGDeviceManager.shared.deviceType == .pad ? 200:100)
                          
                    }
                    
                    Button {
                        game3 = true
                    } label: {
                        Image(.game3Oaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: SGDeviceManager.shared.deviceType == .pad ? 200:100)
                            
                    }.offset(x: -25)
                    
                    Button {
                        game4 = true
                    } label: {
                        Image(.game4Oaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: SGDeviceManager.shared.deviceType == .pad ? 200:100)
                          
                    }
                }
                
                Spacer()
                
            }
        }.background(
            ZStack {
                Image(.menuBgOaklavn)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            }
        )
        .fullScreenCover(isPresented: $game1) {
           CoupleGameView()
        }
        .fullScreenCover(isPresented: $game2) {
            MemorizationViewSG()
            
        }
        .fullScreenCover(isPresented: $game3) {
           // LabirintGameView()
        }
        .fullScreenCover(isPresented: $game4) {
            //NumberGuessGame()
        }
    }
}

#Preview {
    OaklavnChooseView()
}
