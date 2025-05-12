import SwiftUI

@main
struct Oaklavn_GamingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            OaklavnRootView()
                .preferredColorScheme(.light)
        }
    }
}
