//
//  PresentNews.swift
//  ChurchApp

import Foundation

class PresentNews: Controller {
  
  //MARK: - Public variable
  public var VC: NewsViewController!
  
  public func setMessagesTableCell(messages: [CODMessage]){
    self.VC.newsTable.messages = messages.sortedForDate()
    self.VC.newsTable.tableView.reloadData()
    self.VC.newsTable.tableView.scrollTo(.bottom)
  }
}
//MARK: - Initial
extension PresentNews{
  
  //MARK: - Inition
  convenience init(viewController: NewsViewController) {
    self.init()
    self.VC = viewController
  }
}

