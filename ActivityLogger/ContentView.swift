//
//  ContentView.swift
//  ActivityLogger
//
//  Created by Josiah Pilon on 2023-10-20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationStack {
        VStack {
              Image(systemName: "globe")
                  .imageScale(.large)
                  .foregroundStyle(.tint)
              Text("Hello, world!")
          }
        .padding()
      }
    }
}

#Preview {
    ContentView()
}
