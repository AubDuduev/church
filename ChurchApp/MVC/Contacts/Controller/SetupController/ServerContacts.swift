//
//  ServerContacts.swift
//  ChurchApp

import Foundation

class ServerContacts: Controller {
  
  //MARK: - Public variable
  public var VC: ContactsViewController!
  
  
}
//MARK: - Initial
extension ServerContacts{
  
  //MARK: - Inition
  convenience init(viewController: ContactsViewController) {
    self.init()
    self.VC = viewController
  }
}

