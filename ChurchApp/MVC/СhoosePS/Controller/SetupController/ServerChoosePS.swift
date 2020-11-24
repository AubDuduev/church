//
//  ServerChoosePS.swift
//  ChurchApp

import Foundation

class ServerChoosePS: Controller {
  
  //MARK: - Public variable
  public var VC: ChoosePSViewController!
  
  
}
//MARK: - Initial
extension ServerChoosePS{
  
  //MARK: - Inition
  convenience init(viewController: ChoosePSViewController) {
    self.init()
    self.VC = viewController
  }
}

