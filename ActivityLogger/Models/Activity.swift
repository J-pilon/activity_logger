//
//  Activity.swift
//  ActivityLogger
//
//  Created by Josiah Pilon on 2023-10-20.
//

import Foundation

struct Activity: Identifiable {
  let id: String = UUID().uuidString
  var name: String
  var startDate: Date
  var endDate: Date?
}
