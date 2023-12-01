//
//  StartActivityView.swift
//  ActivityLogger
//
//  Created by Josiah Pilon on 2023-10-20.
//

import SwiftUI

struct StartActivityView: View {
  @State var name: String = ""
  var activity = ActivityModel()

    var body: some View {
      VStack {
        Text("What activity are you starting?")
          .bold()
          .font(.title3)

        TextField("Activity", text: $name)

        Button(action: {
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
