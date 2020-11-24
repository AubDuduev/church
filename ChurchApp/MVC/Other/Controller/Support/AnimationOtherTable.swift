//
//  AnimationOtherTable.swift
//  ChurchApp

import Foundation

class AnimationOtherTable: Controller {
  
  //MARK: - Public variable
  public var VC: OtherTableViewController!
  
  
}
//MARK: - Initial
extension AnimationOtherTable{
  
  //MARK: - Inition
  convenience init(viewController: OtherTableViewController) {
    self.init()
    self.VC = viewController
  }
}

