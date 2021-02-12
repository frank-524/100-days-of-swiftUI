//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Frank Lopez on 2/9/21.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        VStack {
            Text("Frank")
                .font(.largeTitle)
            Text("JC")
            Text("KL")
            Text("Nely")
            Text("Francisco")
        }
        .font(.title) // Environment modifier
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
