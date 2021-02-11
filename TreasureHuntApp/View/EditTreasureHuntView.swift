//
//  CreateTreasureHuntView.swift
//  TreasureHuntApp
//
//  Created by Vy on 29.12.20.
//

import SwiftUI

struct EditTreasureHuntView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    @ObservedObject var treasureHunt: TreasureHunt
    
    @State var showCreateCheckpointSheet = false
    @State var name: String = ""
    @State var huntDescription: String = ""
    @State var checkpoints: [CheckpointCreateModel] = []
    
    var body: some View {
        VStack {
            Image("treasure-hunt-test-image")
                .resizable()
                .frame(height: 200.0)
            
            Text("Edit treasure hunt")
                .padding()
                .font(.system(size: 24, weight: .light))
            TextField("Name...", text: $name)
                .padding()
                .frame(height: 10, alignment: .center)
            TextEditor(text: $huntDescription)
                .padding()
                .frame(width: UIScreen.main.bounds.width, height: 80, alignment: .topLeading)
            
//            NavigationLink(
//                destination: CreateCheckpointView(checkpoints: $checkpoints)) {
//                Text("Add Checkpoint").modifyAdd()
//            }
            Button(action: {
                showCreateCheckpointSheet = true
            }, label: {
                Text("Add Checkpoint").modifyAdd()
            })
            List {
                ForEach(checkpoints) { checkpoint in
                    Text("\(checkpoint.name)")
                }.onDelete(perform: deleteCheckpoint)
            }
//            List(checkpoints) { checkpoint in
//                CheckpointEditRow(treasureHunt: treasureHunt, checkpoint: checkpoint)
//            }
            Button(action: finishAndSaveTreasureHuntEdit) {
                Image(systemName: "checkmark").modifyButton(backgroundColor: Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
            }.padding()
        }.sheet(isPresented: $showCreateCheckpointSheet) {
            CreateCheckpointView(checkpoints: $checkpoints)
        }
    }
    
    func deleteCheckpoint(at offsets: IndexSet) {
        let idsToDelete = offsets.map { self.checkpoints[$0].uuid }
        checkpoints.remove(atOffsets: offsets)
        for uuid in idsToDelete {
            let checkpointOpt = treasureHunt.checkpoints?.first(where: { checkpoint -> Bool in
                checkpoint.uuid == uuid
            })
            if let checkpoint = checkpointOpt {
                treasureHunt.removeFromCheckpoints(checkpoint)
                viewContext.delete(checkpoint)
            }
        }
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func finishAndSaveTreasureHuntEdit() {
        let checkpoints = CheckpointCreateModel.createModelsToCheckpoints(self.checkpoints, self.viewContext)
        let checkpointsToAdd = checkpoints.filter { checkpoint -> Bool in
            !(treasureHunt.checkpoints?.contains(checkpoint) ?? false)
        }
        treasureHunt.addToCheckpoints(Set(checkpointsToAdd))
        treasureHunt.setValue(self.name, forKey: "name")
        treasureHunt.setValue(self.huntDescription, forKey: "huntDescription")
        do {
            try viewContext.save()
            self.presentationMode.wrappedValue.dismiss()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct EditTreasureHuntView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        let treasureHunt = PersistenceController.createTreasureHuntForPreview(viewContext: viewContext)
        EditTreasureHuntView(treasureHunt: treasureHunt,
                             checkpoints: CheckpointCreateModel.checkpointsToCreateModels(Array(treasureHunt.checkpoints! as Set)))
            .environment(\.managedObjectContext, viewContext)
//        let treasureHunt = TreasureHunts().treasureHunts.first!
//        EditTreasureHuntView(treasureHunt: treasureHunt)
    }
}
