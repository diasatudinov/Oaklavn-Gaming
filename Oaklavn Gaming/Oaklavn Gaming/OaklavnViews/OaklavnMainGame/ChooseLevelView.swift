import SwiftUI

struct ChooseLevelView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var shopVM: StoreViewModelSG
    @ObservedObject var achievementVM: AchievementsViewModelSG

    @State var openGame = false
    @State var selectedIndex = 0
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
                                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 150:75)
                        }
                        Spacer()
                        OaklavnCoinBg()
                    }.padding([.horizontal, .top])
                }
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                    }
                    ForEach(Range(0...9)) { index in
                        ZStack {
                            Image(.tagaOaklavn)
                                .resizable()
                                .scaledToFit()
                                .frame(width: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50,height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                            
                            Text("\(index + 1)")
                                .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                                .foregroundStyle(.white)
                        }.offset(x: putXLevels(for: index), y: putYLevels(for: index))
                            .onTapGesture {
                                selectedIndex = index
                                DispatchQueue.main.async {
                                    openGame = true
                                }
                                
                            }
                    }
                }
                Spacer()
            }
        }.background(
            ZStack {
                Image(.chooseLevelMainGameOaklavn)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            }
        )
        .fullScreenCover(isPresented: $openGame) {
            GameView(shopVM: shopVM, achievementVM: achievementVM, level: selectedIndex)
        }
    }
    
    func putXLevels(for index: Int) -> CGFloat {
        switch index {
        case 0:
            return 15
        case 1:
            return 60
        case 2:
            return 0
        case 3:
            return -50
        case 4:
            return 0
        case 5:
            return 50
        case 6:
            return 90
        case 7:
            return 150
        case 8:
            return 180
        case 9:
            return 150
        default:
            return 0
        }
    }
    
    func putYLevels(for index: Int) -> CGFloat {
        switch index {
        case 0:
            return 0
        case 1:
            return -20
        case 2:
            return -10
        case 3:
            return -10
        case 4:
            return 0
        case 5:
            return -40
        case 6:
            return -70
        case 7:
            return -120
        case 8:
            return 0
        case 9:
            return 0
        default:
            return 0
        }
    }
}

#Preview {
    ChooseLevelView(shopVM: StoreViewModelSG(), achievementVM: AchievementsViewModelSG())
}
