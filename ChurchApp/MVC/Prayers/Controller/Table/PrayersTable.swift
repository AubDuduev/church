//
//  PrayersTable.swift
//  ChurchApp
//
//  Created by Senior Developer on 09.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class PrayersTable: NSObject {
  
  public var controllers: PrayersControllers?
  public var tableView  : UITableView!
  public var prayers    : [DECPrayer]!
}
//MARK: - Delegate
extension PrayersTable: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
//MARK: - DataSources
extension PrayersTable: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.tableView = tableView
    return self.prayers?.count ?? 0
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    self.tableView = tableView
    return 1
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = PrayersTableCell().tableCell()
    cell.configure(controllers: self.controllers, prayer: self.prayers?[indexPath.row])
  return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
}
