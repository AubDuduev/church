//
//  ChoosePSTable.swift
//  ChurchApp
//
//  Created by Senior Developer on 30.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class ChoosePSTable: NSObject {
  
  public var controllers : ChoosePSControllers?
  public var tableView   : UITableView!
  public var choosePSData: ChoosePSData!
  
}
//MARK: - Delegate
extension ChoosePSTable: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
//MARK: - DataSources
extension ChoosePSTable: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch self.choosePSData.type! {
      case .Icon:
        return Icons.allCases.count
      case .Saint:
        return Saints.allCases.count
    }
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = ChoosePSTableCell().tableCell()
    cell.configure(controllers: self.controllers, indexPath: indexPath, type: self.choosePSData.type)
  return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
  return 70
  }
  
}
