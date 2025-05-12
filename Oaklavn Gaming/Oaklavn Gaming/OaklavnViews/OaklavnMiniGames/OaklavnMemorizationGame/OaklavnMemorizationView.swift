import SwiftUI

struct OaklavnMemorizationView: View {
    @StateObject var user = OaklavnUser.shared
    @Environment(\.presentationMode) var presentationMode
    
    let cardImages = ["card1Oaklavn", "card2Oaklavn", "card3Oaklavn", "card4Oaklavn", "card5Oaklavn", "card6Oaklavn", "card7Oaklavn", "card8Oaklavn"]
    let sequenceLength = 3
    
    @State private var sequence: [Int] = []
    @State private var currentStep: Int? = nil
    @State private var gamePhase: GamePhase = .showing
    @State private var userInputIndex = 0
    @State private var feedback: String? = nil
    
    enum GamePhase {
        case showing
        case userTurn
        case finished
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack {
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
                        }.padding([.horizontal, .top])
                        
                        Image(.memorizationTextOaklavn)
                            .resizable()
                            .scaledToFit()
                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:100)
                    }
                }
                
                Spacer()
                
                if gamePhase == .showing {
                    // Full-screen reveal of each card in sequence
                    if let idx = currentStep {
                        MemorizationCardView(imageName: cardImages[idx])
                            .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 600:300)
                            .padding()
                            .transition(.opacity)
                    }
                } else {
                    ZStack {
                        Image(.memorizationGameBgOaklavn)
                            .resizable()
                            .scaledToFit()
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 3), spacing: 2) {
                            ForEach(0..<cardImages.count, id: \.self) { index in
                                MemorizationCardView(imageName: cardImages[index])
                                    .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 300:190)
                                    .onTapGesture {
                                        handleTap(on: index)
                                    }
                            }
                        }
                        .padding()
                    }
                }
                
                Spacer()
                
                
            }
            
            if gamePhase == .finished {
                
                if userInputIndex >= sequenceLength {
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
                                    startGame()
                                } label: {
                                    Image(.nextBtnOaklavn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 200:100)
                                }
                            }
                        }
                    }
                } else {
                    ZStack {
                        Image(.gameOverBgOaklavn)
                            .resizable()
                            .ignoresSafeArea()
                        VStack(spacing: -40) {
                            
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
                                    startGame()
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
                
            }
        }
        .background(
            ZStack {
                Image(.memorizationBgOaklavn)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            }
        )
        .onAppear {
            startGame()
        }
        .animation(.easeInOut, value: currentStep)
    }
    
    private var headerText: String {
        switch gamePhase {
        case .showing:
            return "Watch the sequence..."
        case .userTurn:
            return "Your turn: repeat the sequence"
        case .finished:
            return feedback ?? ""
        }
    }
    
    private func startGame() {
        sequence = Array(0..<cardImages.count).shuffled().prefix(sequenceLength).map { $0 }
        userInputIndex = 0
        feedback = nil
        gamePhase = .showing
        currentStep = nil
        
        Task {
            await revealSequence()
        }
    }
    
    @MainActor
    private func revealSequence() async {
        for idx in sequence {
            currentStep = idx
            try? await Task.sleep(nanoseconds: 800_000_000)
            currentStep = nil
            try? await Task.sleep(nanoseconds: 300_000_000)
        }
        gamePhase = .userTurn
    }
    
    private func handleTap(on index: Int) {
        guard gamePhase == .userTurn else { return }
        if index == sequence[userInputIndex] {
            userInputIndex += 1
            if userInputIndex >= sequenceLength {
                feedback = "Correct! You win!"
                user.updateUserMoney(for: 100)
                gamePhase = .finished
                
            }
        } else {
            feedback = "Wrong! Try again."
            gamePhase = .finished
        }
    }
}

struct MemorizationCardView: View {
    let imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .cornerRadius(8)
            .shadow(radius: 4)
    }
}

#Preview {
    OaklavnMemorizationView()
}
