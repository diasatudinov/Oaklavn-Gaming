import Foundation

struct OaklavnCard: Identifiable {
    let id = UUID()
    let type: String
    var isFaceUp = false
    var isMatched = false
}
