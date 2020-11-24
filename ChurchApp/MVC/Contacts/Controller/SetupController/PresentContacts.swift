//
//  PresentContacts.swift
//  ChurchApp

import Foundation

class PresentContacts: Controller {
  
  //MARK: - Public variable
  public var VC: ContactsViewController!
  
  
}
//MARK: - Initial
extension PresentContacts{
  
  //MARK: - Inition
  convenience init(viewController: ContactsViewController) {
    self.init()
    self.VC = viewController
  }
}

