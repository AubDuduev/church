//
//  ScrollTableButtonView.swift
//  DgBetTrip
//
//  Created by Senior Developer on 20.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import UIKit

class ScrollTableButtonView: UIView {
  
  public var tableView: UITableView!

  public func setup(table: UITableView){
    self.tableView = table
    self.animation(show: false)
  }
  public func animation(show: Bool){
    UIView.animate(withDuration: 0.5) {
      if !show {
        self.alpha     = 0
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
      } else {
        self.alpha     = 1
        self.transform = .identity
      }
    }
  }
  @IBAction func scrollButtonLabel(button: UIButton){
    self.tableView.scrollTo(.bottom)
  }
}
