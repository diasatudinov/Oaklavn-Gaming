import SwiftUI

class OaklavnAchievementsViewModel: ObservableObject {
    
    @Published var achievements: [OaklavnAchievement] = [
        OaklavnAchievement(image: "achi1IconOaklavn", achievedCount: 0, achievedMaxCount: 1, isAchieved: false),
        OaklavnAchievement(image: "achi2IconOaklavn", achievedCount: 0, achievedMaxCount: 5, isAchieved: false),
        OaklavnAchievement(image: "achi3IconOaklavn", achievedCount: 0, achievedMaxCount: 1, isAchieved: false),
        OaklavnAchievement(image: "achi4IconOaklavn", achievedCount: 0, achievedMaxCount: 10, isAchieved: false),
        OaklavnAchievement(image: "achi5IconOaklavn", achievedCount: 0, achievedMaxCount: 20, isAchieved: false)

    ] {
        didSet {
            saveAchievementsItem()
        }
    }
    
    init() {
        loadAchievementsItem()
        
    }
    
    private let userDefaultsAchievementsKey = "achievementsKeyOaklavn"
    
    func achieveToggle(_ achive: OaklavnAchievement) {
        guard let index = achievements.firstIndex(where: { $0.id == achive.id })
        else {
            return
        }
        achievements[index].isAchieved.toggle()
        
    }
    
    func achieveCheck(_ achive: OaklavnAchievement) {
        guard let index = achievements.firstIndex(where: { $0.image == achive.image })
        else {
            return
        }
        
        if achievements[index].achievedCount < achievements[index].achievedMaxCount {
            achievements[index].achievedCount += 1
        } else {
            achievements[index].isAchieved = true
        }
    }
    
    func saveAchievementsItem() {
        if let encodedData = try? JSONEncoder().encode(achievements) {
            UserDefaults.standard.set(encodedData, forKey: userDefaultsAchievementsKey)
        }
        
    }
    
    func loadAchievementsItem() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsAchievementsKey),
           let loadedItem = try? JSONDecoder().decode([OaklavnAchievement].self, from: savedData) {
            achievements = loadedItem
        } else {
            print("No saved data found")
        }
    }
}

struct OaklavnAchievement: Codable, Hashable, Identifiable {
    var id = UUID()
    var image: String
    var achievedCount: Int
    var achievedMaxCount: Int
    var isAchieved: Bool
}
