import SwiftUI

struct OaklavnCardView: View {
    let card: Card

    var body: some View {
        ZStack {
            if card.isFaceUp || card.isMatched {
                Image(card.type)
                    .resizable()
                    .scaledToFit()
                    .frame(height: SGDeviceManager.shared.deviceType == .pad ? 200:120)
            } else {
                Image(.cardBackOaklavn)
                    .resizable()
                    .scaledToFit()
                    .frame(height: SGDeviceManager.shared.deviceType == .pad ? 200:120)
            }
        }
    }
}

#Preview {
    OaklavnCardView(card: Card(type: "cardFace1Oaklavn"))
}
