import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Moment.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: false)]
    ) private var moments: FetchedResults<Moment>

    @State private var showAddMoment = false
    @State private var momentToEdit: Moment?

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(moments) { moment in
                        VStack(alignment: .leading) {
                            Text(moment.text ?? "")
                                .font(.headline)
                            Text(moment.date ?? Date(), formatter: itemFormatter)
                                .font(.subheadline)
                        }
                        .onTapGesture {
                                                   momentToEdit = moment
                                               }
                    }
                    .onDelete(perform: deleteItems)
                    
                }
                .listStyle(InsetGroupedListStyle())

                Button(action: { showAddMoment.toggle() }) {
                    Label("Add Today's Moment", systemImage: "plus.circle")
                        .font(.title2)
                        .padding()
                }
                .sheet(isPresented: $showAddMoment) {
                    AddMomentView()
                }
                .sheet(item: $momentToEdit) { moment in
                                    EditMomentView(moment: moment)
                                }
            }
            .navigationTitle("One Day, Life, Moment")
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { moments[$0] }.forEach(viewContext.delete)
            saveContext()
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

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter
}()


