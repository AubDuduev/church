//
//  PresentOrders.swift
//  ChurchApp

import Foundation

class PresentOrders: Controller {
  
  //MARK: - Public variable
  public var VC: OrdersViewController!
  
  public func ordersTable(orders: [DECOrder]){
    self.VC.ordersTable.orders = orders
    self.VC.ordersTable.tableView.reloadData()
  }
}
//MARK: - Private functions
extension PresentOrders {
  
  public func data(cell: OrdersTableCell){
    cell.numberLabel.text   = String(cell.order.ID ?? 0)
    cell.summLabel.text     = (cell.order.amount ?? "0") + " ₽"
    cell.statusLabel.text   = cell.order.statusPay
    cell.titleLabel.text    = cell.order.title
    cell.requrentLabel.text = LengthDaysRus.getType(name: cell.order.requrentPeriod).rawValue
    //Date
    let timeInterval = Double(cell.order.date ?? "0") ?? 0.0
    let date = Date(timeIntervalSince1970: timeInterval)
    let time         = date.getDateStaring(format: .time)
    let monthDayYear = date.getDateStaring(format: .monthDayYear)
    let result       = time + " " + monthDayYear
    cell.dateLabel.text = result
  }
}
//MARK: - Initial
extension PresentOrders{
  
  //MARK: - Inition
  convenience init(viewController: OrdersViewController) {
    self.init()
    self.VC = viewController
  }
}

