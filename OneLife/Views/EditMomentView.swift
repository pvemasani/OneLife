import SwiftUI
struct EditMomentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var moment: Moment
    @State private var momentDate: Date
    
    init(moment: Moment) {
           self.moment = moment
           _momentDate = State(initialValue: moment.date ?? Date())
       }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit your moment")) {
                    TextEditor(text: Binding(
                        get: { moment.text ?? "" },
                        set: { moment.text = $0 }
                    ))
                    .frame(minHeight: 100)
                }
                
                Section(header: Text("Update the date")) {
                                    DatePicker("Select date", selection: $momentDate, displayedComponents: .date)
                                }


                Button("Save") {
                                    moment.date = momentDate
                                    saveContext()
                                    presentationMode.wrappedValue.dismiss()
                                }
            }
            .navigationTitle("Edit Moment")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
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
