import SwiftUI

struct OaklavnAchievementsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AchievementsViewModelSG
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
                                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:75)
                        }
                        Spacer()
                    }.padding([.horizontal, .top])
                }
                VStack {
                    Image(.achievementsTextOaklavn)
                        .resizable()
                        .scaledToFit()
                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 120:60)
                        .offset(y: -20)
                    
                    VStack(spacing: 50) {
                        
                        HStack {
                            
                            VStack(spacing: -20) {
                                
                                ZStack {
                                    Image(viewModel.achievements[0].image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:150)
                                    if !viewModel.achievements[0].isAchieved {
                                        Image(.lockIconOaklavn)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:100)
                                    }
                                }
                                
                                if !viewModel.achievements[0].isAchieved {
                                    ZStack {
                                        
                                        Image(.numBgOaklavn)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                                        
                                        if viewModel.achievements[0].achievedMaxCount == 1 {
                                            Text("-")
                                                .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                                                .foregroundStyle(.yellow)
                                                .offset(x: 5, y: -5)
                                        } else {
                                            Text("\(viewModel.achievements[0].achievedCount)/\(viewModel.achievements[0].achievedMaxCount)")
                                                .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                                                .foregroundStyle(.yellow)
                                                .offset(x: 5, y: -5)
                                        }
                                    }
                                } else {
                                    Image(.stickIconOaklavn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                                }
                                
                            }.offset(y: -20)
                                .onTapGesture {
                                    viewModel.achieveCheck(viewModel.achievements[0])
                                }
                            
                            VStack(spacing: -20) {
                                
                                ZStack {
                                    Image(viewModel.achievements[1].image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:150)
                                    
                                    if !viewModel.achievements[1].isAchieved {
                                        Image(.lockIconOaklavn)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:100)
                                    }
                                }
                                if !viewModel.achievements[1].isAchieved {
                                    ZStack {
                                        Image(.numBgOaklavn)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                                        
                                        
                                        if viewModel.achievements[1].achievedMaxCount == 1 {
                                            Text("-")
                                                .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                                                .foregroundStyle(.yellow)
                                                .offset(x: 5, y: -5)
                                        } else {
                                            Text("\(viewModel.achievements[1].achievedCount)/\(viewModel.achievements[1].achievedMaxCount)")
                                                .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                                                .foregroundStyle(.yellow)
                                                .offset(x: 5, y: -5)
                                        }
                                    }
                                } else {
                                    Image(.stickIconOaklavn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                                }
                            }
                            .offset(y: 40)
                            .onTapGesture {
                                viewModel.achieveCheck(viewModel.achievements[1])
                            }
                        }
                        
                        HStack {
                            VStack(spacing: -20) {
                                
                                ZStack {
                                    Image(viewModel.achievements[2].image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:150)
                                    if !viewModel.achievements[2].isAchieved {
                                        Image(.lockIconOaklavn)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:100)
                                    }
                                }
                                
                                if !viewModel.achievements[2].isAchieved {
                                    ZStack {
                                        Image(.numBgOaklavn)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                                        
                                        if viewModel.achievements[2].achievedMaxCount == 1 {
                                            Text("-")
                                                .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                                                .foregroundStyle(.yellow)
                                                .offset(x: 5, y: -5)
                                        } else {
                                            Text("\(viewModel.achievements[2].achievedCount)/\(viewModel.achievements[2].achievedMaxCount)")
                                                .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                                                .foregroundStyle(.yellow)
                                                .offset(x: 5, y: -5)
                                        }
                                    }
                                    
                                } else {
                                    Image(.stickIconOaklavn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                                }
                            }.offset(y: -20)
                                .onTapGesture {
                                    viewModel.achieveCheck(viewModel.achievements[2])
                                }
                            
                            VStack(spacing: -20) {
                                
                                ZStack {
                                    Image(viewModel.achievements[3].image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:150)
                                    
                                    if !viewModel.achievements[3].isAchieved {
                                        Image(.lockIconOaklavn)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:100)
                                    }
                                }
                                
                                if !viewModel.achievements[3].isAchieved {
                                    ZStack {
                                        Image(.numBgOaklavn)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                                        
                                        if viewModel.achievements[3].achievedMaxCount == 1 {
                                            Text("-")
                                                .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                                                .foregroundStyle(.yellow)
                                                .offset(x: 5, y: -5)
                                        } else {
                                            Text("\(viewModel.achievements[3].achievedCount)/\(viewModel.achievements[3].achievedMaxCount)")
                                                .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                                                .foregroundStyle(.yellow)
                                                .offset(x: 5, y: -5)
                                        }
                                    }
                                } else {
                                    Image(.stickIconOaklavn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                                }
                            }.offset(y: 40).onTapGesture {
                                viewModel.achieveCheck(viewModel.achievements[3])
                            }
                        }
                        
                        HStack {
                            VStack(spacing: -20) {
                                
                                ZStack {
                                    Image(viewModel.achievements[4].image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:150)
                                    
                                    if !viewModel.achievements[4].isAchieved {
                                        Image(.lockIconOaklavn)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:100)
                                    }
                                }
                                
                                if !viewModel.achievements[4].isAchieved {
                                    ZStack {
                                        Image(.numBgOaklavn)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                                        
                                        if viewModel.achievements[4].achievedMaxCount == 1 {
                                            Text("-")
                                                .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                                                .foregroundStyle(.yellow)
                                                .offset(x: 5, y: -5)
                                        } else {
                                            Text("\(viewModel.achievements[4].achievedCount)/\(viewModel.achievements[4].achievedMaxCount)")
                                                .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                                                .foregroundStyle(.yellow)
                                                .offset(x: 5, y: -5)
                                        }
                                    }
                                    
                                } else {
                                    Image(.stickIconOaklavn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                                }
                            }.onTapGesture {
                                viewModel.achieveCheck(viewModel.achievements[4])
                            }
                            
                            VStack(spacing: -20) {
                                
                                ZStack {
                                    Image(viewModel.achievements[4].image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 300:150)
                                    
                                    if !viewModel.achievements[4].isAchieved {
                                        Image(.lockIconOaklavn)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:100)
                                    }
                                }
                                
                                ZStack {
                                    Image(.numBgOaklavn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 100:50)
                                    
                                    if viewModel.achievements[4].achievedMaxCount == 1 {
                                        Text("-")
                                            .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                                            .foregroundStyle(.yellow)
                                            .offset(x: 5, y: -5)
                                    } else {
                                        Text("\(viewModel.achievements[4].achievedCount)/\(viewModel.achievements[4].achievedMaxCount)")
                                            .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                                            .foregroundStyle(.yellow)
                                            .offset(x: 5, y: -5)
                                    }
                                }
                            }.opacity(0)
                        }
                    }
                    
                }
                Spacer()
            }
            
        }.background(
            ZStack {
                Image(.achievementsBgOaklavn)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            }
        )
    }
}

#Preview {
    OaklavnAchievementsView(viewModel: AchievementsViewModelSG())
}
