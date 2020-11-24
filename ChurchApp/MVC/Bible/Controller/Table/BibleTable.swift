//
//  BibleTable.swift
//  ChurchApp
//
//  Created by Senior Developer on 04.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class BibleTable: NSObject {
  
  public var controllers: BibleControllers?
  public var tableView  : UITableView!
  public var bible      : DECBible!
}
//MARK: - Delegate
extension BibleTable: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.tableView.deselectRow(at: indexPath, animated: true)
    self.controllers?.logic.pushBibleText(indexPath: indexPath)
  }
}
//MARK: - DataSources
extension BibleTable: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.tableView = tableView
    return self.bible?.storages?[section].books?.count ?? 0
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    self.tableView = tableView
    return self.bible?.storages?.count ?? 0
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = BibleTableCell().tableCell()
    cell.configure(controllers: self.controllers, book: self.bible?.storages?[indexPath.section].books?[indexPath.row])
  return cell
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = BibleHeaderView().loadNib()
    header.configure(controllers: self.controllers, storage: self.bible?.storages?[section])
    return header
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }
}
