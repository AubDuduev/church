//
//  ServicesTable.swift
//  ChurchApp
//
//  Created by Senior Developer on 23.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class ServicesTable: NSObject {
  
  public var controllers: ServicesControllers?
  public var tableView  : UITableView!
  public var services   : [DECService]!
}
//MARK: - Delegate
extension ServicesTable: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
//MARK: - DataSources
extension ServicesTable: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.tableView = tableView
    return self.services?.count ?? 0
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    self.tableView = tableView
    return 1
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = ServicesTableCell().tableCell()
    cell.configure(controllers: self.controllers, service: self.services?[indexPath.row], index:indexPath.row)
  return cell
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = UIView()
    view.backgroundColor = .clear
    return view
  }
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 20
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  return 84
  }
  
}
