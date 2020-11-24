//
//  ChoiceCell.swift
//  DgBetTrip
//
//  Created by Developer on 28.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

class ChoiceCell {
  
  public func set(_ messages: [(key: String, value: [CODMessage])]?, _ type: ChoiceCell.Types, _ controllers: Controllers?, _ indexPath: IndexPath) -> UITableViewCell {
    
    let messages = messages?[indexPath.section]
    let message  = messages?.value[indexPath.row]
    
    switch self.choice(message: message, type: type) {
      case .Video:
        let cell = VideoTableViewCell().tableCell()
        cell.configure(controllers: controllers, message: message)
        return cell
      case .Chat:
        let cell = ChatTableCell().tableCell()
        let controler = controllers as! ChatControllers
        cell.configure(controllers: controler, message: message)
        return cell
      case .News:
        let cell = NewTableCell().tableCell()
        let controler = controllers as! NewsControllers
        cell.configure(controllers: controler, message: message)
        return cell
      case .None:
        return UITableViewCell()
    }
  }
  private func choice(message: CODMessage?, type: ChoiceCell.Types) -> Types {
    
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
