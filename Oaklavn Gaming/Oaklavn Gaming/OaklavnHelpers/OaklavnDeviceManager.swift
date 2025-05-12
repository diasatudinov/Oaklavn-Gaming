import UIKit

class OaklavnDeviceManager {
    static let shared = OaklavnDeviceManager()
    
    var deviceType: UIUserInterfaceIdiom
    
    private init() {
        self.deviceType = UIDevice.current.userInterfaceIdiom
    }
}
