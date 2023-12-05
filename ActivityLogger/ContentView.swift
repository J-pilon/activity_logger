//
//  ContentView.swift
//  ActivityLogger
//
//  Created by Josiah Pilon on 2023-10-20.
//

import SwiftUI

struct ContentView: View {

  @Environment(\.modelContext) var modelContext

  var body: some View {
    NavigationStack {
      VStack {
        NavigationLink(destination: StartActivityView()) {
          Text("Start an Activity")
        }
        .padding()        
        NavigationLink(destination: ActivityListView()) {
          Text("Activity Listing")
        }
        .padding()
      }
    }
  }
}

#Preview {
  ContentView()
}
