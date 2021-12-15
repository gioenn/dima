//
//  ContentView.swift
//  RandomImages
//
//  Created by Giovanni Quattrocchi on 15/12/21.
//

import SwiftUI
import URLImage

struct ContentView: View {
    
    @State private var lastId = Int.random(in: 0...1000)
    @State private var history: [ImageData] = []
    
    var body: some View {
        let url = URL(string: "https://picsum.photos/id/\(lastId)/600")!
        NavigationView {
            VStack {
                URLImage(url, failure: { _,_ in
                    Text("Missing image")
                }, content: { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                })
                Button(action: {
                    history.append(ImageData(url: url))
                    lastId = Int.random(in: 0...1000)
                }){
                    Text("NEXT").bold().font(.callout).accentColor(Color.white).padding(10).background(.blue)
                }
                NavigationLink(destination:  HistoryView(history: $history)){
                    Text("HISTORY").bold().font(.callout).accentColor(Color.white).padding(10).background(.green)
                }
               
            }.navigationBarTitle("Random Images")
        }
    }
}

struct HistoryView: View {
    
    @Binding var history: [ImageData]
    
    var body: some View {
        List(history) { image in
            URLImage(image.url, failure: { _,_ in
                Text("Missing image")
            }, content: { image in
                image.resizable().aspectRatio(contentMode: .fit)
            })
        }.navigationTitle("History").navigationBarItems(trailing: Button(action: { history.removeAll() }){
            Image(systemName: "trash").imageScale(.large)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
