//
//  StartActivityView.swift
//  ActivityLogger
//
//  Created by Josiah Pilon on 2023-10-20.
//

import SwiftUI
import SwiftData

struct StartActivityView: View {
  @State var name: String = ""

  @Environment(\.modelContext) var modelContext

  @State var activity = Activity()

    var body: some View {
      VStack {
        Text("What activity are you starting?")
          .bold()
          .font(.title3)

        TextField("Activity", text: $activity.name )

        Button(action: {
       //   activity.name = $name
          modelContext.insert(activity)
          print(name)
        }, label: {
          Text("Start")
        })
      }
    }
}

#Preview {
    StartActivityView()
}
