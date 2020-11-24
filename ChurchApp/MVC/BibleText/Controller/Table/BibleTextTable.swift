//
//  BibleTextTable.swift
//  ChurchApp
//
//  Created by Senior Developer on 05.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class BibleTextTable: NSObject {
  
  public var controllers: BibleTextControllers?
  public var tableView  : UITableView!
  public var poems      : [DECChapterVerses]!
  public var translate  : TranslateBible = .content
}
//MARK: - Delegate
extension BibleTextTable: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
//MARK: - DataSources
extension BibleTextTable: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.tableView = tableView
    return self.poems?.count ?? 0
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    self.tableView = tableView
    return 1
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = BibleTextTableCell().tableCell()
    cell.configure(controllers: self.controllers,
                   verses     : self.poems?[indexPath.row],
                   translate  : self.translate)
  return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    return tableView.estimatedRowHeight
  }
  
}
