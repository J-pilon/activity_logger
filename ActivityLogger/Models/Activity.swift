//
//  Activity.swift
//  ActivityLogger
//
//  Created by Josiah Pilon on 2023-10-20.
//

import Foundation
import SwiftData

@Model
class Activity {
  //  var activities: [Activity] = []
  //

  var id: String
  var startDate: Date
  var endDate: Date?
  var name: String

  init(id: String = UUID().uuidString,
       startDate: Date = .now,
       endDate: Date? = nil,
       name: String = ""
  ) {
    self.id = id
    self.startDate = startDate
    self.endDate = endDate
    self.name = name
  }

  //  start a activity
  //  save the start time and date
  //  stop an activity
  //  save the stop time and date
  //  save the input in an array
  //  persist the data using swiftdata

  //  Create a page to view running time for activity
  //  button to stop timer

}
