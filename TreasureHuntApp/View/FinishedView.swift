//
//  FinishedView.swift
//  TreasureHuntApp
//
//  Created by Vy on 13.02.21.
//

import SwiftUI

struct FinishedView: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    @State var name: String
    
    var body: some View {
        VStack {
            Image(systemName: "crown")
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            Text("Congratulations!").font(.title)
            Text("You finished \n\(name)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
            Text("Hope you enjoyed this little adventure. :)")
                .font(.title3)
        }
    }
}

struct FinishedView_Previews: PreviewProvider {
    static var previews: some View {
        FinishedView(name: "Berlin Hunt")
    }
}
