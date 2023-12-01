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
        NavigationLink(destination: StartActivityView()) {
          Text("Start an Activity")
        }
        .padding()
      }
    }
  }
}

#Preview {
    ContentView()
}
