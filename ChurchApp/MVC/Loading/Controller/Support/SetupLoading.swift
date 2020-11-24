//
//  SetupLoading.swift
//  ChurchApp

import Foundation

class SetupLoading: Controller {
  
  //MARK: - Public variable
  public var VC: LoadingViewController!
  
  
}
//MARK: - Initial
extension SetupLoading{
  
  //MARK: - Inition
  convenience init(viewController: LoadingViewController) {
    self.init()
    self.VC = viewController
  }
}

