//
//  ContentView.swift
//  Calculator
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
         ZStack {
           Text("Hello World")
            
           //Background
           Rectangle()
              
           
           Rectangle()
               .rotationEffect(Angle(degrees: 45))
       }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
