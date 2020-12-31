//
//  TreasureHuntListView.swift
//  TreasureHuntApp
//
//  Created by Vy on 28.12.20.
//

import SwiftUI

struct TreasureHuntsListView: View {
    
    @State private var treasureHunts = TreasureHunt.getTreasureHunts()
    
    var body: some View {
        VStack {
            HStack {
                // Go back
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "arrow.backward")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }.padding()
                Spacer()
                // Create Hunt
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Create Hunt")
                        .padding()
                        .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .background(Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
                        .cornerRadius(10.0)
                }.padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 10))
            }
            Divider()
            Text("Treasure Hunts")
                .padding()
                .font(.system(size: 28, weight: .light))
            List(treasureHunts) {
                treasueHunt in TreasureHuntRow(treasureHunt: treasueHunt)
            }
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct TreasureHuntListView_Previews: PreviewProvider {
    static var previews: some View {
        TreasureHuntsListView()
    }
}
