//
//  CardView.swift
//  Slot_Machine
//
//  Created by zhozh on 12.03.2020.
//  Copyright © 2020 zhozh. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Binding var symbol: String
    @Binding var back: Color
    
    var body: some View {
        
        Image(symbol)
        .resizable()
        .padding(.all, 25)
        .aspectRatio(1, contentMode: .fit)
        .foregroundColor(.green)
        .background(back.opacity(0.5))
        .cornerRadius(30)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("apple"), back: Binding.constant(Color.green))
    }
}
