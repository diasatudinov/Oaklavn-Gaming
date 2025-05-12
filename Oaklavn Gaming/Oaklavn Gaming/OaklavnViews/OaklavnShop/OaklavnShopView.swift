import SwiftUI

struct OaklavnShopView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var user = OaklavnUser.shared
    @State var section: StoreSection = .skin
    @ObservedObject var viewModel: StoreViewModelSG
    @State var skinIndex: Int = 0
    @State var backIndex: Int = 0
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    HStack {
                    }

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
                }

                Spacer()
                ZStack {
                    Image(.shopBgOaklavn)
                        .resizable()
                        .scaledToFit()

                    HStack {
                        Button {
                            if skinIndex > 0 {
                                skinIndex -= 1
                            }
                        } label: {
                            Image(.arrowLeftShop)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 150:75)
                                .scaleEffect(x: -1,y: 1)
                        }
                        achievementItem(item: viewModel.shopTeamItems.filter({ $0.section == .skin })[skinIndex])

                        Button {
                            if skinIndex < viewModel.shopTeamItems.filter({ $0.section == .skin }).count - 1 {
                                skinIndex += 1
                            }
                        } label: {
                            Image(.arrowLeftShop)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 150:75)
                                
                        }
                    }
                }
                Spacer()
            }
        }.background(
            ZStack {
                Image(.shopViewBgOaklavn)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            }
        )
    }

    @ViewBuilder func achievementItem(item: Item) -> some View {

        VStack {
            ZStack(alignment: .top) {
                if item.section == .skin {
                    Image(.skinBgOaklavn)
                        .resizable()
                        .scaledToFit()
                }
                
                VStack(spacing: 0) {
                    
                    Image(item.icon)
                        .resizable()
                        .scaledToFit()
                        .padding(OaklavnDeviceManager.shared.deviceType == .pad ? 40:30)
                    
                    
                }
                ZStack {
                    Image(.nameBgOaklavn)
                        .resizable()
                        .scaledToFit()
                    
                    Image("\(item.name)TextIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20)
                        .offset(y: -7)
                }
                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                .offset(y: -20)
            }.frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 378:240)
            
            
            Button {
                if item.section == .skin {
                    if viewModel.boughtItems.contains(where: { $0.name == item.name }) {
                        viewModel.currentPersonItem = item
                    } else {
                        if !viewModel.boughtItems.contains(where: { $0.name == item.name }) {
                            
                            if user.money >= item.price {
                                user.minusUserMoney(for: item.price)
                                viewModel.boughtItems.append(item)
                            }
                        }
                    }
                }
            } label: {
                if viewModel.boughtItems.contains(where: { $0.name == item.name }) {
                    VStack {
                        
                        ZStack {
                            Image(.btnBgShop)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                            
                            if let currentItem = viewModel.currentPersonItem, currentItem.name == item.name {
                                Image(.stickIconOaklavn)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                            }
                            
                        }
                    }
                } else {
                    VStack {
                        ZStack {
                            Image(.btnIconShopOaklavn)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                                .opacity(user.money >= item.price ? 1:0.5 )
                            
                            
                        }
                    }
                }
                
            }
        }
    }

}

#Preview {
    OaklavnShopView(viewModel: StoreViewModelSG())
}
