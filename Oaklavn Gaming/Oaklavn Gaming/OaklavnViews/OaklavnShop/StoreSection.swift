import SwiftUI

enum StoreSection: Codable, Hashable {
    case backgrounds
    case skin
}

class OaklavnStoreViewModel: ObservableObject {
    @Published var shopTeamItems: [Item] = [
        Item(name: "spot", image: "iconSkin1Oaklavn", icon: "imageSkin1Oaklavn", section: .skin, price: 100),
        Item(name: "snow", image: "iconSkin2Oaklavn", icon: "imageSkin2Oaklavn", section: .skin, price: 100),
        Item(name: "pooh", image: "iconSkin3Oaklavn", icon: "imageSkin3Oaklavn", section: .skin, price: 100),
        Item(name: "bell", image: "iconSkin4Oaklavn", icon: "imageSkin4Oaklavn", section: .skin, price: 100),
        Item(name: "pony", image: "iconSkin5Oaklavn", icon: "imageSkin5Oaklavn", section: .skin, price: 100),
        Item(name: "blackie", image: "iconSkin6Oaklavn", icon: "imageSkin6Oaklavn", section: .skin, price: 100),
        Item(name: "spirit", image: "iconSkin7Oaklavn", icon: "imageSkin7Oaklavn", section: .skin, price: 100),
    ]
    
    @Published var boughtItems: [Item] = [
        Item(name: "spot", image: "iconSkin1Oaklavn", icon: "imageSkin1Oaklavn", section: .skin, price: 100),
    ] {
        didSet {
            saveBoughtItem()
        }
    }
    
    @Published var currentPersonItem: Item? {
        didSet {
            saveCurrentPerson()
        }
    }
    
    init() {
        loadCurrentPerson()
        loadBoughtItem()
    }
    
    private let userDefaultsPersonKey = "HorseKeyOaklavn"
    private let userDefaultsBoughtKey = "boughtItemsOaklavn"

    
    func saveCurrentPerson() {
        if let currentItem = currentPersonItem {
            if let encodedData = try? JSONEncoder().encode(currentItem) {
                UserDefaults.standard.set(encodedData, forKey: userDefaultsPersonKey)
            }
        }
    }
    
    func loadCurrentPerson() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsPersonKey),
           let loadedItem = try? JSONDecoder().decode(Item.self, from: savedData) {
            currentPersonItem = loadedItem
        } else {
            currentPersonItem = shopTeamItems[0]
            print("No saved data found")
        }
    }
    
    func saveBoughtItem() {
        if let encodedData = try? JSONEncoder().encode(boughtItems) {
            UserDefaults.standard.set(encodedData, forKey: userDefaultsBoughtKey)
        }
        
    }
    
    func loadBoughtItem() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsBoughtKey),
           let loadedItem = try? JSONDecoder().decode([Item].self, from: savedData) {
            boughtItems = loadedItem
        } else {
            print("No saved data found")
        }
    }
    
}

struct Item: Codable, Hashable {
    var id = UUID()
    var name: String
    var image: String
    var icon: String
    var section: StoreSection
    var price: Int
}
