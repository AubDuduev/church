//
//  PresentPrayers.swift
//  ChurchApp

import Foundation

class PresentPrayers: Controller {
  
  //MARK: - Public variable
  public var VC: PrayersViewController!
  
  public func prayersTable(prayers: [DECPrayer]){
    self.VC.prayersTable.prayers = prayers
    self.VC.prayersTable.tableView.reloadData()
  }
  public func navBarTitleLabel(prayer: DECPrayer? = nil){
    self.VC.navBarTitleLabel.text = prayer?.title ?? "Молитвослов"
  }
}
//MARK: - PrayersTableCell
extension PresentPrayers {
  
  public func data(cell: PrayersTableCell){
    cell.titlePrayerLabel.text = cell.prayer?.title
  }
}

//MARK: - Initial
extension PresentPrayers{
  
  //MARK: - Inition
  convenience init(viewController: PrayersViewController) {
    self.init()
    self.VC = viewController
  }
}

