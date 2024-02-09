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

@Query(filter: #Predicate<Activity> { $0.endDate == nil }) 
var runningActivity: [Activity]

struct StartActivityView: View {
  @Environment(\.dismiss) private var dismiss
  @State var activity = Activity()
  @State var isVisible: Bool = false

  @Environment(\.modelContext) var modelContext

    var body: some View {
      VStack {
        if (!runningActivity.isEmpty) {
            Text("35 Minutes")
        } else {
          Text("What activity are you starting?")
            .bold()
            .font(.title3)

          TextField("Activity", text: $activity.name)
            .padding(.leading, 30)

          Button(action: {
            beginActivity(activityName: activity.name)
            let stopwatch = StopwatchViewModel()
            isVisible = true
          }, label: {
            Text("Begin")
          })
        }
      }
      .sheet(isPresented: $isVisible, content: {
        StopwatchView()
      })
    }

  private func beginActivity(activityName: String) {
      let newActivity = Activity()
      newActivity.name = activityName

      do {
        modelContext.insert(newActivity)
      } catch {
          print("Error saving context: \(error)")
      }
  }
}

#Preview {
  do {
      let config = ModelConfiguration(isStoredInMemoryOnly: true)
      let container = try ModelContainer(for: Activity.self, configurations: config)

      return StartActivityView()
          .modelContainer(container)
  } catch {
      fatalError("Failed to create model container.")
  }
}
