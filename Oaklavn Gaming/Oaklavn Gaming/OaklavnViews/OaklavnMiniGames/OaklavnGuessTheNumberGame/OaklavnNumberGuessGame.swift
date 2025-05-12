import SwiftUI

struct OaklavnNumberGuessGame: View {
    @Environment(\.presentationMode) var presentationMode

    // MARK: - Game State
        @State private var target = Int.random(in: 100...999)
    @State private var guessDigits: [String] = []
    @State private var feedback: String = ""
    @State private var attempts = 0
    
    private let padNumbers = [1, 2, 3,
                              4, 5, 6,
                              7, 8, 9,
                              0]
    

        var body: some View {
            ZStack {
                VStack(spacing: OaklavnDeviceManager.shared.deviceType == .pad ? 40:20) {
                    // Top bar
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

                    // Title
                    Image(.guessTheNumTextOaklavn)
                        .resizable()
                        .scaledToFit()
                        .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 260:130)
                    // Input slots
                    HStack(spacing: 16) {
                        ForEach(0..<3) { idx in
                            ZStack {
                                Image(.numberBgOaklavn)
                                    .resizable()
                                    .scaledToFit()
                                    
                                Text( idx < guessDigits.count ? guessDigits[idx] : "" )
                                    .font(.system(size: 36, weight: .bold))
                                    .foregroundColor(.white)
                            }.frame(width: OaklavnDeviceManager.shared.deviceType == .pad ? 150:100, height: OaklavnDeviceManager.shared.deviceType == .pad ? 150:100)
                        }
                    }
                    .padding(.vertical)


                    // Number Pad
                    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
                    LazyVGrid(columns: columns, spacing: OaklavnDeviceManager.shared.deviceType == .pad ? 24:12) {
                        ForEach(padNumbers, id: \ .self) { num in
                            Button(action: { numberPressed(num) }) {
                                ZStack {
                                    Image(.keyboardBtnBgOaklavn)
                                        .resizable()
                                        .scaledToFit()
                                    Text("\(num)")
                                        .font(.system(size: OaklavnDeviceManager.shared.deviceType == .pad ? 96:48, weight: .bold))
                                        .foregroundColor(.white)
                                }.frame(width: OaklavnDeviceManager.shared.deviceType == .pad ? 150:100, height: OaklavnDeviceManager.shared.deviceType == .pad ? 150:100)
                            }
                            .disabled(guessDigits.count >= 3)
                        }
                    }.frame(width: OaklavnDeviceManager.shared.deviceType == .pad ? 500:350)
                    .padding(.horizontal)

                    Spacer()
                }
                
                if !feedback.isEmpty {
                    Text(feedback)
                        .font(.title2)
                        .foregroundColor(.yellow)
                        .padding(.bottom, 10)
                        .shadow(radius: 2)
                    
                    ZStack {
                        Image(.mazeInccorectBgOaklavn)
                            .resizable()
                            .scaledToFit()
                        
                        if Int(guessDigits.joined()) ?? 0 < target {
                            Image(.guessHigherOaklavn)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 50:25)
                        } else if Int(guessDigits.joined()) ?? 0 > target{
                            Image(.guessLowerOaklavn)
                                .resizable()
                                .scaledToFit()
                                .frame(height: OaklavnDeviceManager.shared.deviceType == .pad ? 50:25)
                        } else {
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
                                            resetGame()
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
            }.background(
                ZStack {
                    Image(.mazeViewBgOaklavn)
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                }
            )
        }

    // MARK: - Actions
    private func numberPressed(_ num: Int) {
        guard guessDigits.count < 3 else { return }
        guessDigits.append("\(num)")
        if guessDigits.count == 3 {
            evaluateGuess()
        }
    }

    private func evaluateGuess() {
        let guess = Int(guessDigits.joined()) ?? 0
        attempts += 1
        if guess < target {
            feedback = "Too low!"
        } else if guess > target {
            feedback = "Too high!"
        } else {
            feedback = "You got it in \(attempts) tries!"
            OaklavnUser.shared.updateUserMoney(for: 100)
        }
        if feedback.starts(with: "You got it") {
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                guessDigits = []
                feedback = ""
            }
        }
    }

    private func resetGame() {
        target = Int.random(in: 100...999)
        guessDigits = []
        feedback = ""
        attempts = 0
    }
}

#Preview {
    OaklavnNumberGuessGame()
}

