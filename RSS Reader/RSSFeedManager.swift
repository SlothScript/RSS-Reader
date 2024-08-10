import Foundation
import SwiftUI

class RSSFeedManager: ObservableObject {
    @Published var feedItems: [FeedItem] = []

    func loadFeed(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("Error loading RSS feed: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            let parser = RSSParser(data: data)
            DispatchQueue.main.async {
                self?.feedItems = parser.parse()
            }
        }
        task.resume()
    }
}
