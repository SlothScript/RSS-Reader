import Foundation

class RSSParser: NSObject, XMLParserDelegate {
    private var data: Data
    private var parser: XMLParser?
    private var currentElement = ""
    private var currentTitle = ""
    private var currentDescription = ""
    private var feedItems: [FeedItem] = []

    init(data: Data) {
        self.data = data
        super.init()
        self.parser = XMLParser(data: data)
        self.parser?.delegate = self
    }

    func parse() -> [FeedItem] {
        parser?.parse()
        return feedItems
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == "item" {
            currentTitle = ""
            currentDescription = ""
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if currentElement == "title" {
            currentTitle += string
        } else if currentElement == "description" {
            currentDescription += string
        }
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let item = FeedItem(title: currentTitle, description: currentDescription)
            feedItems.append(item)
        }
    }
}
