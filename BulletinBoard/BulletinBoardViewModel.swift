import Foundation
import FirebaseFirestore

class BulletinBoardViewModel: ObservableObject {
    @Published var items: [BulletinItem] = []
    private var db = Firestore.firestore()

    func fetchItems() {
        db.collection("bulletinItems").order(by: "timestamp").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.items = querySnapshot.documents.compactMap { document in
                    BulletinItem(document: document)
                }
            }
        }
    }

    func addItem(title: String, content: String) {
        let newItem = BulletinItem(title: title, content: content, timestamp: Date())
        do {
            _ = try db.collection("bulletinItems").addDocument(data: newItem.toDictionary())
        } catch {
            print(error)
        }
    }
}
