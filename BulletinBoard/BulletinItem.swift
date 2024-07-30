import Foundation
import FirebaseFirestore

struct BulletinItem: Identifiable {
    var id: String?
    var title: String
    var content: String
    var timestamp: Date

    init(id: String? = nil, title: String, content: String, timestamp: Date) {
        self.id = id
        self.title = title
        self.content = content
        self.timestamp = timestamp
    }

    init?(document: DocumentSnapshot) {
        let data = document.data()
        guard let title = data?["title"] as? String,
              let content = data?["content"] as? String,
              let timestamp = data?["timestamp"] as? Timestamp else {
            return nil
        }
        self.id = document.documentID
        self.title = title
        self.content = content
        self.timestamp = timestamp.dateValue()
    }

    func toDictionary() -> [String: Any] {
        return [
            "title": title,
            "content": content,
            "timestamp": timestamp
        ]
    }
}
