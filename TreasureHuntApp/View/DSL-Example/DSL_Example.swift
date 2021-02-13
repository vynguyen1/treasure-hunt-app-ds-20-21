//
//  DSL_Example.swift
//  TreasureHuntApp
//
//  Created by Vy on 06.02.21.
//

import SwiftUI

extension View {
    
    // Used in TreasureHuntsListView, DetailedHuntView, CreateCheckpointView and CreateTreasureHuntView
    func modifyButton(backgroundColor: Color) -> some View {
        self.modifier(ButtonModifier(backgroundColor: backgroundColor))
    }
    
    // Used in EditTreasureHuntView and CreateTreasureHuntView
    func modifyAdd() -> some View {
        self.modifier(AddModifier())
    }
    
    // Used 2x in StartView
    func modifyStartButton(backgroundColor: Color?) -> some View {
        self.modifier(StartButtonModifier(backgroundColor: backgroundColor))
    }
}

struct ButtonModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 130, height: 50, alignment: .center)
            .foregroundColor(.white)
            .background(backgroundColor)
            .cornerRadius(10.0)
    }
}

struct AddModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 170, height: 50, alignment: .center)
            .foregroundColor(.white)
            .background(Color.init(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
            .cornerRadius(10.0)
    }
}

struct StartButtonModifier: ViewModifier {
    let backgroundColor: Color?
    
    func body(content: Content) -> some View {
        content.padding()
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .frame(width: 250, height: 70, alignment: .center)
            .foregroundColor(.white)
            .background(backgroundColor)
            .cornerRadius(20.0)
    }
}
