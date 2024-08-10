import SwiftUI

@main
struct RSSReaderApp: App {
    @StateObject private var rssFeedManager = RSSFeedManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(rssFeedManager)
        }
    }
}
