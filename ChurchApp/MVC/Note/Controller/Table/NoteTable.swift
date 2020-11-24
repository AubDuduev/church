//
//  NoteTable.swift
//  ChurchApp
//
//  Created by Senior Developer on 14.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class NoteTable: NSObject {
  
  public var controllers: NoteControllers?
  public var tableView  : UITableView!
  public var names      = 1
}
//MARK: - Delegate
extension NoteTable: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
//MARK: - DataSources
extension NoteTable: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.tableView = tableView
    return self.names
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = NoteTableCell().tableCell()
    cell.configure(controllers: self.controllers, indexPath: indexPath)
  return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
  return 65
  }
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    scrollView.bounces = false
  }
}
