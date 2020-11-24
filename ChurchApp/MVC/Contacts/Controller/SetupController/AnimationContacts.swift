//
//  AnimationContacts.swift
//  ChurchApp

import Foundation

class AnimationContacts: Controller {
  
  //MARK: - Public variable
  public var VC: ContactsViewController!
  
  
}
//MARK: - Initial
extension AnimationContacts{
  
  //MARK: - Inition
  convenience init(viewController: ContactsViewController) {
    self.init()
    self.VC = viewController
  }
}

