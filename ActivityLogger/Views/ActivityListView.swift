//
//  ActivityListView.swift
//  ActivityLogger
//
//  Created by David Wasserman on 2023-12-05.
//

import SwiftUI
import SwiftData

struct ActivityListView: View {

  @Query var activities: [Activity]

    var body: some View {

      ForEach(activities) { activity in
        NavigationLink(destination: ActivityDetailView(activity: activity)) {

              HStack {
                  Text(activity.name)
                      .font(.headline)

                Text(activity.endDate?.formatted(date: .long, time: .shortened) ?? "No end date")
              }
          }
      }
    }
}

#Preview {
  do {
      let config = ModelConfiguration(isStoredInMemoryOnly: true)
      let container = try! ModelContainer(for: Activity.self, configurations: config)

    for i in 1..<10 {
      let activity = Activity(endDate: Date(timeIntervalSinceNow: TimeInterval(60 * 60 * i)), name: "Example Activity \(i)")
            container.mainContext.insert(activity)
        }

      return ActivityListView()
          .modelContainer(container)
  } catch {
      fatalError("Failed to create model container.")
  }
}
