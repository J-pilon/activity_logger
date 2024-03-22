//
//  ActivityDetailView.swift
//  ActivityLogger
//
//  Created by Josiah Pilon on 2024-03-22.
//

import SwiftUI

struct ActivityDetailView: View {
  let activity: Activity

    var body: some View {
      VStack {
        Text(activity.name)
  
//        Text(activity.duration())
      }

    }
}

#Preview {
    ActivityDetailView(activity: Activity())
}
