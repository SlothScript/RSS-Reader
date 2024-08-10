import Cocoa
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var rssFeedManager: RSSFeedManager?

    func applicationDidFinishLaunching(_ notification: Notification) {
        rssFeedManager = RSSFeedManager()
    }
    
    func application(_ application: NSApplication, open urls: [URL]) {
        for url in urls {
            if url.scheme == "rss" {
                rssFeedManager?.loadFeed(from: url)
            }
        }
    }
}
