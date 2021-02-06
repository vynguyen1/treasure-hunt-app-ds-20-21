//
//  StartView.swift
//  TreasureHuntApp
//
//  Created by Vy on 28.12.20.
//

import SwiftUI

struct StartView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Treasure Hunt APP")
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                VStack(spacing: 30) {
                    NavigationLink(destination: TreasureHuntsListView()) {
                        Text("Treasure Hunts")
                                .modifyStartButton(backgroundColor: Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
                        
                    }
                    NavigationLink(destination: InstructionsView()) {
                        Text("Instructions")
                                .modifyStartButton(backgroundColor: Color.init(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                    }
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
