//
//  ChoiceHightCell.swift
//  ChurchApp
//
//  Created by Senior Developer on 01.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ChoiceHightCell {
  
  var messages: (key: String, value: [CODMessage])!
  var message : CODMessage!
  
  public func set(_ messages: [(key: String, value: [CODMessage])]?, _ type: ChoiceHightCell.Types, _ tableView: UITableView, _ indexPath: IndexPath) -> CGFloat {
    
    self.messages = messages?[indexPath.section]
    self.message  = self.messages?.value[indexPath.row]
    
    switch self.choice(message: self.message, type: type) {
      case .Video:
        if self.checkSquareVideo() {
          return tableView.estimatedRowHeight
        } else {
          return 450
        }
      case .Chat:
        return tableView.estimatedRowHeight
      case .News:
        return tableView.estimatedRowHeight
      case .None:
        return tableView.estimatedRowHeight
    }
  }
  private func checkSquareVideo() -> Bool {
    guard let videoURL = self.message?.video else { return true }
    guard videoURL.contains("square") else { return true }
    return false
  }
  private func choice(message: CODMessage?, type: ChoiceHightCell.Types) -> Types {
    
    switch true {
      case message?.video != nil:
        return .Video
      case message?.video == nil :
        return type
      case message?.video == nil :
        return type
      default:
        return .None
    }
  }
  enum Types {
    
    case News
    case Chat
    case Video
    case None
  }
}
