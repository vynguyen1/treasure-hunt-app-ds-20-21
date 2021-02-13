//
//  CreateTreasureHuntView.swift
//  TreasureHuntApp
//
//  Created by Vy on 01.01.21.
//

import SwiftUI
import CoreData

struct CreateTreasureHuntView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var showCreateCheckpointSheet = false
    @State var huntDescription: String = ""
    @State var name: String = ""
    @State var checkpoints: [CheckpointCreateModel] = []
    
    var body: some View {
        VStack {
            Image("treasure-hunt-test-image")
                .resizable()
                .frame(height: 200.0)
//                Text("Create a treasure hunt")
//                    .padding()
//                    .font(.system(size: 24, weight: .light))
            Form {
                Section(header: Text("Details")) {
                    TextField("Name...", text: $name, onCommit:  {
                        UIApplication.shared.endEditing()
                    })
                        .padding()
                        .frame(height: 10, alignment: .center)
                    TextField("Description...", text: $huntDescription, onCommit:  {
                        UIApplication.shared.endEditing()
                    })
                        .padding()
                    //.frame(width: UIScreen.main.bounds.width, height: 80, alignment: .topLeading)
                }
                Section(header: Text("Checkpoints")) {
                    List {
                        ForEach(checkpoints.sorted(by: { $0.rank < $1.rank })) { checkpoint in
                            Text("\(checkpoint.name)")
                            // CheckpointEditRow(checkpoint: checkpoint)
                        }.onDelete(perform: deleteCheckpoint)
                    }
                }
            }
            HStack {
                Button(action: {
                    showCreateCheckpointSheet = true
                }, label: {
                    Text("Add Checkpoint").modifyAdd()
                })
                Button(action: addTreasureHunt) {
                    Image(systemName: "checkmark").modifyButton(backgroundColor: Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
                }.padding()
            }
        }
        .sheet(isPresented: $showCreateCheckpointSheet) {
            CreateCheckpointView(checkpoints: $checkpoints)
        }
        .navigationTitle("Create a Treasure Hunt")
    }
    
    func deleteCheckpoint(at offsets: IndexSet) {
        checkpoints.remove(atOffsets: offsets)
        
        for index in 0..<checkpoints.count {
            checkpoints[index].rank = index
        }
    }
    
    func addTreasureHunt() {
        let treasureHuntDescription = NSEntityDescription.entity(forEntityName: "TreasureHunt", in: viewContext)
        let treasureHunt = TreasureHunt(entity: treasureHuntDescription!, insertInto: viewContext)
        treasureHunt.uuid = UUID()
        treasureHunt.name = self.name
        treasureHunt.huntDescription = self.huntDescription
        for checkpoint in checkpoints {
            let checkpoint = CheckpointCreateModel.createModelToCheckpoint(checkpoint, viewContext)
            treasureHunt.addToCheckpoints(checkpoint)
        }
        treasureHunt.inProgress = false
        treasureHunt.finished = false
        try? viewContext.save()
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct CreateTreasureHuntView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTreasureHuntView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
