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
          NavigationLink(value: activity) {
              VStack(alignment: .leading) {
                  Text(activity.name)
                      .font(.headline)

                Text(activity.endDate?.formatted(date: .long, time: .shortened) ?? "No end date")
              }
          }
      }
    }
}

#Preview {
    ActivityListView()
}
