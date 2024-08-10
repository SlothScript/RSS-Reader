import Foundation
import SwiftUI

@main
struct RSSReaderApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // Handle the URL and process the RSS feed
        if url.scheme == "rss" {
            // Implement logic to open and parse the RSS feed
            print("Received URL: \(url)")
            return true
        }
        return false
    }
}
