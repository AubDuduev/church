//
//  WorshipTable.swift
//  ChurchApp
//
//  Created by Senior Developer on 25.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class ProgramTable: NSObject {
  
  public var controllers: WorshipControllers?
  public var tableView  : UITableView!
  public var programms  : [DECProgram]!
  
}
//MARK: - Delegate
extension ProgramTable: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
//MARK: - DataSources
extension ProgramTable: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return programms?.count ?? 0
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = ProgramTableCell().tableCell()
    cell.configure(controllers: self.controllers, programm: self.programms?[indexPath.row])
  return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
  return 50
  }
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    scrollView.isScrollEnabled = false
  }
}
