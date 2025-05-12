import SwiftUI

struct OaklavnCoinBg: View {
    @StateObject var user = OaklavnUser.shared
    var body: some View {
        ZStack {
            Image(.coinsBgOaklavn)
                .resizable()
                .scaledToFit()
            
            Text("\(user.money)")
                .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                .foregroundStyle(.white)
                .textCase(.uppercase)
                .offset(x: OaklavnDeviceManager.shared.deviceType == .pad ? -20:-10)
            
            
            
        }.frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 160:80)
        
    }
}

#Preview {
    OaklavnCoinBg()
}
