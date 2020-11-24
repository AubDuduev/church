//
//  NewsTable.swift
//  ChurchApp
//
//  Created by Senior Developer on 23.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class NewsTable: NSObject, MessagesChatUpdatoble {
  
  public var controllers: Controllers?
  public var tableView  : UITableView!
  public var messages   : [(key: String, value: [CODMessage])]!
  
  //MARK: - Private variable
  private let setupHeaderChat = SetupHeaderChat()
  private let choiceCell      = ChoiceCell()
}
//MARK: - Delegate
extension NewsTable: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
//MARK: - DataSources
extension NewsTable: UITableViewDataSource {
  
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.tableView = tableView
    return messages?[section].value.count ?? 0
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    self.tableView = tableView
    return messages?.count ?? 0
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return self.choiceCell.set(self.messages, .News, self.controllers, indexPath)
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return self.setupHeaderChat.setup(tableView: self.tableView, dictionary: self.messages, section: section)
   }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return tableView.estimatedRowHeight
  }
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let controllers = self.controllers as! NewsControllers
    controllers.logic.showScrollTableButtonView(show: scrollView.isBottom(to: 100))
    controllers.logic.updateEarlyMessage(scrol: scrollView, messages: self.messages)
  }
  func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if cell is VideoTableViewCell {
      (cell as! VideoTableViewCell).pauseVideo()
    }
  }
  
}
