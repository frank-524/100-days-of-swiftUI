//
//  CustomModifiers.swift
//  ViewsAndModifiers
//
//  Created by Frank Lopez on 2/10/21.
//

import SwiftUI

// Create our own custom ViewModifier struct that does what we want
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
    
}

/*
    When using custom modifiers, it's usually a smart idea to create extensions on View that make them easier to use
 */
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct CustomModifiers: View {
    
    
    var body: some View {
        Text("Hello World")
            .titleStyle()
            .frame(width: 300, height: 200)
            .watermarked(with: "Hacking with Swift")
    }
}

struct CustomModifiers_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifiers()
    }
}
