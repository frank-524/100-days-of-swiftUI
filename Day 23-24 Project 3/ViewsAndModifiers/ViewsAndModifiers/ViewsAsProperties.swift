//
//  ViewsAsProperties.swift
//  ViewsAndModifiers
//
//  Created by Frank Lopez on 2/10/21.
//

import SwiftUI

struct ViewsAsProperties: View {
    var motto1: some View { Text("Draco dormiens")}
    let motto2 = Text("Nunquam titillandus")
    var body: some View {
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
        }
    }
}

struct ViewsAsProperties_Previews: PreviewProvider {
    static var previews: some View {
        ViewsAsProperties()
    }
}
