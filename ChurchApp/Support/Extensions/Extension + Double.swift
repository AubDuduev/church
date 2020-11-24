//
//  Extension + Date.swift
//  DG.BET
//
//  Created by -=ALEKSANDR=- on 14/August/2019.
//  Copyright © 2019 -=ALEKSANDR=-. All rights reserved.
//
import Foundation

extension Double {
  
  func format(_ formatDate: FormatDate) -> String {
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = formatDate.rawValue
    let result = dateFormater.string(from: Date(timeIntervalSince1970: self))
  return result
  }
  //transform in time
  func getLastMessageTime() -> String {
    let dateFormater = DateFormatter()
    let calendar     = Calendar.current
    let date         = Date(timeIntervalSince1970: self)
    dateFormater.dateFormat = "dd MMMM"
    //Sorted title date message
    switch true {
    //today message
    case calendar.isDateInToday(date):
      dateFormater.dateFormat = "HH:mm"
      return dateFormater.string(from: date)
    //Yesterday message
    case calendar.isDateInYesterday(date):
      return "Вчера"
    //all message
    default:
      return dateFormater.string(from: date)
    }
  }
  enum FormatDate: String {
    case time     = "HH:mm"
    case monthDay = "MM.dd"
    case monthDayYear = "MM.dd.yy"
    case dayMonthText = "dd MMMM"
    case long         = "MMMM d, yyyy"
  }
}
