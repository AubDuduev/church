//
//  PresentChat.swift
//  ChurchApp

import Foundation

class PresentChat: Controller {
  
  //MARK: - Public variable
  public var VC: ChatViewController!
  
  public func setMessagesChatTableCell(messages: [CODMessage]){
    self.VC.chatTable.messages = messages.sortedForDate()
    self.VC.chatTable.tableView.reloadData()
    self.VC.chatTable.tableView.scrollTo(.bottom)
  }
}
//MARK: - Initial
extension PresentChat{
  
  //MARK: - Inition
  convenience init(viewController: ChatViewController) {
    self.init()
    self.VC = viewController
  }
}

