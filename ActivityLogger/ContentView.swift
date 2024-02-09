//
//  ContentView.swift
//  ActivityLogger
//
//  Created by Josiah Pilon on 2023-10-20.
//

import SwiftUI
import SwiftData

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
//  ContentView()
//    .environment(\.modelContext, [Activity.self])
  do {
      let config = ModelConfiguration(isStoredInMemoryOnly: true)
      let container = try ModelContainer(for: Activity.self, configurations: config)

      return ContentView()
          .modelContainer(container)
  } catch {
      fatalError("Failed to create model container.")
  }
}
