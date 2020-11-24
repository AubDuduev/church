//
//  MessagesChatUpdatoble.swift
//  DgBetTrip
//
//  Created by Developer on 26.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit
protocol MessagesChatUpdatoble {
  
  var controllers: Controllers? { get set }
  var tableView  : UITableView! { get set }
  var messages   : [(key: String, value: [CODMessage])]! { get set }
}
