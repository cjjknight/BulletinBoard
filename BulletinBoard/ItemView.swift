import SwiftUI

struct ItemView: View {
    var item: BulletinItem

    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title).font(.headline)
            Text(item.content).font(.subheadline)
            Text("\(item.timestamp, formatter: itemFormatter)").font(.caption)
        }
    }
}
