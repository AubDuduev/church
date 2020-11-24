//
//  LogicOtherTable.swift
//  ChurchApp

import UIKit

class LogicOtherTable: Controller {
  
  //MARK: - Public variable
  public var VC: OtherTableViewController!
  
  public func shareVC(){
    let controller = UIActivityViewController(activityItems: ["Поделись с друзями"], applicationActivities: nil)
    self.VC.present(controller, animated: true, completion: nil)
  }
}
//MARK: - Initial
extension LogicOtherTable{
  
  //MARK: - Inition
  convenience init(viewController: OtherTableViewController) {
    self.init()
    self.VC = viewController
  }
}

