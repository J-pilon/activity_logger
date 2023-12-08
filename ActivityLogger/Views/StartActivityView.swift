//
//  StartActivityView.swift
//  ActivityLogger
//
//  Created by Josiah Pilon on 2023-10-20.
//

import SwiftUI
import SwiftData

//@Query(filter: #Predicate<Activity> { activity in
//  activity.endDate == nil
//}, sort: \Activity.name) var runningActivity: [Activity]

@Query(filter: #Predicate<Activity> { activity in
  if activity.endDate == nil {
      return true
  } else {
      return false
  }
}) var runningActivity: Activity?

struct StartActivityView: View {
  @State var activity = Activity()

  @Environment(\.modelContext) var modelContext

    var body: some View {
      VStack {
        if (runningActivity != nil) {
          Text("35 Minutes")
        } else {
          Text("What activity are you starting?")
            .bold()
            .font(.title3)

          TextField("Activity", text: $activity.name)
            .padding(.leading, 30)

          Button(action: {
           // activity.name = name
            print("Activity Name: \(activity.name)")
            modelContext.insert(activity)
          }, label: {
            Text("Start")
          })
        }
      }
    }
}

#Preview {
  do {
      let config = ModelConfiguration(isStoredInMemoryOnly: true)
      let container = try ModelContainer(for: Activity.self, configurations: config)

      let example = Activity()
      return StartActivityView()
          .modelContainer(container)
  } catch {
      fatalError("Failed to create model container.")
  }
}
