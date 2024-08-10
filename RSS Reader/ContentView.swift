import SwiftUI

struct ContentView: View {
    @EnvironmentObject var rssFeedManager: RSSFeedManager
    @State private var feedURL: String = ""
    
    var body: some View {
        NavigationView {
            SidebarView(feedURL: $feedURL, addFeedAction: addFeed)
            FeedListView()
        }
    }
    
    private func addFeed() {
        if let url = URL(string: feedURL) {
            rssFeedManager.loadFeed(from: url)
            feedURL = "" // Clear the input field after adding
        }
    }
}

struct SidebarView: View {
    @Binding var feedURL: String
    var addFeedAction: () -> Void

    var body: some View {
        VStack {
            TextField("Enter RSS Feed URL", text: $feedURL)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: addFeedAction) {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                    .padding()
            }
            .padding()
            
            Spacer()
        }
        .frame(maxWidth: 300)
        .background(Color(NSColor.windowBackgroundColor)) // Use Color for background
    }
}

struct FeedListView: View {
    @EnvironmentObject var rssFeedManager: RSSFeedManager

    var body: some View {
        List(rssFeedManager.feedItems) { item in
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                Text(item.description)
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
