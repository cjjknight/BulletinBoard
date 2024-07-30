import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = BulletinBoardViewModel()

    @State private var title = ""
    @State private var content = ""

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.items) { item in
                    ItemView(item: item)
                }

                HStack {
                    TextField("Title", text: $title).textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Content", text: $content).textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        viewModel.addItem(title: title, content: content)
                        title = ""
                        content = ""
                    }) {
                        Text("Add")
                    }
                }
                .padding()
            }
            .navigationBarTitle("Bulletin Board")
            .onAppear {
                viewModel.fetchItems()
            }
        }
    }
}

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()
