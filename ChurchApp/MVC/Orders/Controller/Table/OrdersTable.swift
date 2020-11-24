//
//  OrdersTable.swift
//  ChurchApp
//
//  Created by Senior Developer on 28.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class OrdersTable: NSObject {
  
  public var controllers: OrdersControllers?
  public var tableView  : UITableView!
  public var orders     : [DECOrder]!
}
//MARK: - Delegate
extension OrdersTable: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
//MARK: - DataSources
extension OrdersTable: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.tableView = tableView
    return self.orders?.count ?? 0
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = OrdersTableCell().tableCell()
    cell.configure(controllers: self.controllers, order: orders?[indexPath.row])
  return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
  return 200
  }
  
}
