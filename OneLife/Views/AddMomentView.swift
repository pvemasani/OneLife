import SwiftUI

    struct AddMomentView: View {
        @Environment(\.managedObjectContext) private var viewContext
        @Environment(\.presentationMode) var presentationMode

        @State private var momentText = ""

        var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("What made today special?")) {
                        TextEditor(text: $momentText)
                            .frame(minHeight: 100)
                    }

                    Button("Save") {
                        addMoment()
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(momentText.isEmpty)
                }
                .navigationTitle("New Moment")
                .navigationBarItems(leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                })
            }
        }

        private func addMoment() {
            let newMoment = Moment(context: viewContext)
            newMoment.text = momentText
            newMoment.date = Date()
            saveContext()
        }

        private func saveContext() {
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
