//
//  LogicContacts.swift
//  ChurchApp

import Foundation

class LogicContacts: Controller {
  
  //MARK: - Public variable
  public var VC: ContactsViewController!
  
  
}
//MARK: - Initial
extension LogicContacts{
  
  //MARK: - Inition
  convenience init(viewController: ContactsViewController) {
    self.init()
    self.VC = viewController
  }
}

