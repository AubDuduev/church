//
//  OrderType.swift
//  ChurchApp
//
//  Created by Senior Developer on 19.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

enum OrderType: String {
  case error
  case healthNote    = "health_note"
  case restNote      = "rest_note"
  case prayerService = "prayer_service"
  case proskomidiya, sorokoust, product, donation, psaltir
}
