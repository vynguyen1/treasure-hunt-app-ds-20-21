//
//  InstructionsView.swift
//  TreasureHuntApp
//
//  Created by Vy on 31.12.20.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        VStack {
            Image(systemName: "mappin.and.ellipse")
            Text("This app enables you to create your own treasure hunts that you can use to go on little adventures with. :)")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            Image(systemName: "map")
            Text("Further instructions here coming soon...").padding()        }
        .navigationBarTitle("Instructions")
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}
