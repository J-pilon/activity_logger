//
//  StartActivityView.swift
//  ActivityLogger
//
//  Created by Josiah Pilon on 2023-10-20.
//

import SwiftUI
import SwiftData

struct StartActivityView: View {
  @State var activity = Activity()

  @Environment(\.modelContext) var modelContext

    var body: some View {
      VStack {
        Text("What activity are you starting?")
          .bold()
          .font(.title3)

        TextField("Activity", text: $activity.name )

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

#Preview {
    StartActivityView()
}
