//
//  ResetView.swift
//  Counter
//
//  Created by Giovanni Quattrocchi on 15/12/21.
//

import SwiftUI

struct ResetView: View {
    
    @Binding var counter: Float
    
    var body: some View {
        Button(action: {
            counter = 0
        }){
            Text("RESET").bold().font(.headline).accentColor(.white).padding(10).background(.blue)
        }
    }
}

struct ResetView_Previews: PreviewProvider {
    @State static var counter: Float = 10
    static var previews: some View {
        ResetView(counter: $counter)
    }
}
