//
//  RouterContacts.swift
//  ChurchApp
import Foundation

class RouterContacts: Controller {
  
  //MARK: - Public variable
  public var VC: ContactsViewController!
  
  
}
//MARK: - Initial
extension RouterContacts{
  
  //MARK: - Inition
  convenience init(viewController: ContactsViewController) {
    self.init()
    self.VC = viewController
  }
}

