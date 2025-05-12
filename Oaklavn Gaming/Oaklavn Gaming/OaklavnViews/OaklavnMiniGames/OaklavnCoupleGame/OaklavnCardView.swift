import SwiftUI

struct OaklavnCardView: View {
    let card: OaklavnCard

    var body: some View {
        ZStack {
            if card.isFaceUp || card.isMatched {
                Image(card.type)
                    .resizable()
                    .scaledToFit()
                    .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:120)
            } else {
                Image(.cardBackOaklavn)
                    .resizable()
                    .scaledToFit()
                    .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:120)
            }
        }
    }
}

#Preview {
    OaklavnCardView(card: OaklavnCard(type: "cardFace1Oaklavn"))
}
