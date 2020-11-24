
//
//  See.swift
//  DgBetTrip
//
//  Created by Senior Developer on 29.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

class SetupHeaderChat {
  
  
  public func setup(tableView: UITableView, dictionary: [(key: String, value: [CODMessage])]?, section: Int) -> UIView {
    let headerView       = UIView()
    let dateMessageLabel = UILabel()
    let dateFormatter    = DateFormatter()
    //Added
    headerView.addSubview(dateMessageLabel)
    //Layer setup
    dateMessageLabel.cornerRadius(12.5, true)
    dateMessageLabel.shadowColor(color: .black, radius: 3, sizeW: 0, sizeH: 0)
    dateMessageLabel.borderColor(.lightGray, 0.5)
    dateMessageLabel.shadowColor(color: .black, radius: 0.5, sizeW: 0, sizeH: 0)
    //Set constarint
    dateMessageLabel.frame    = CGRect(x: 0, y: 5, width: 99, height: 25)
    dateMessageLabel.center.x = tableView.center.x
    //Set color
    headerView.backgroundColor       = .clear
    dateMessageLabel.backgroundColor = UIColor.set(.tabBarFon)
    dateMessageLabel.textColor       = .white
    //Set font
    dateMessageLabel.textAlignment = .center
    dateMessageLabel.font = UIFont.set(.rubikRegular, 13)
    //Set date
    dateFormatter.dateFormat = "MMMM d, yyyy"
    let date = dateFormatter.date(from: dictionary?[section].key ?? "")
    let timeInterval = date?.timeIntervalSince1970
    dateMessageLabel.text = timeInterval?.format(.dayMonthText)
    
  return headerView
  }
}

