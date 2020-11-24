//
//  UnreadNewMessageView.swift
//  DgBetTrip
//
//  Created by Senior Developer on 21.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

class UnreadNewMessageView: UIView {
  
  @IBOutlet weak var countMessageLabel: UILabel!
  
  public var countUnreadMessage = 0 
  
  public func set(){
    if self.countUnreadMessage != 0 {
      self.countMessageLabel.text = String(self.countUnreadMessage)
      self.alpha = 1
    } else {
      self.alpha = 0
    }
  }
}
