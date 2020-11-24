//
//  PresentBible.swift
//  ChurchApp

import Foundation

class PresentBible: Controller {
  
  //MARK: - Public variable
  public var VC: BibleViewController!
  
  public func bibleTable(bible: DECBible?){
    self.VC.bibleTable.bible = bible
    self.VC.bibleTable.tableView.reloadData()
  }
}
//MARK: - Initial
extension PresentBible{
  
  //MARK: - Inition
  convenience init(viewController: BibleViewController) {
    self.init()
    self.VC = viewController
  }
}

