//
//  SetupBible.swift
//  ChurchApp

import Foundation

class SetupBible: Controller {
  
  //MARK: - Public variable
  public var VC: BibleViewController!
  
  public func viewDidLoad() {
    self.bibleTable()
  }
}
//MARK: - Private functions
extension SetupBible {
  
  private func bibleTable(){
    self.VC.bibleTable.controllers = self.VC.controllers
  }
}
//MARK: - Initial
extension SetupBible{
  
  //MARK: - Inition
  convenience init(viewController: BibleViewController) {
    self.init()
    self.VC = viewController
  }
}

