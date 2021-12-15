//
//  ResetViewRef.swift
//  Counter
//
//  Created by Giovanni Quattrocchi on 15/12/21.
//

import SwiftUI

struct ResetViewRef: View {
    @ObservedObject var counter: Model
    
    var body: some View {
        Button(action: {
            counter.value = 0
        }){
            Text("RESET").bold().font(.headline).accentColor(.white).padding(10).background(.red)
        }
    }
}

struct ResetViewRef_Previews: PreviewProvider {
    @StateObject static var counter: Model = Model()
    static var previews: some View {
        ResetViewRef(counter: counter)
    }
}
