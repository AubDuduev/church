//
//  ServerEditText.swift
//  ChurchApp

import Foundation

class ServerEditText: Controller {
  
  //MARK: - Public variable
  public var VC: EditTextViewController!
  
  
}
//MARK: - Initial
extension ServerEditText{
  
  //MARK: - Inition
  convenience init(viewController: EditTextViewController) {
    self.init()
    self.VC = viewController
  }
}

