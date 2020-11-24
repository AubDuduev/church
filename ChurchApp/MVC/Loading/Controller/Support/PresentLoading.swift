//
//  PresentLoading.swift
//  ChurchApp

import Foundation

class PresentLoading: Controller {
  
  //MARK: - Public variable
  public var VC: LoadingViewController!
  
  
}
//MARK: - Initial
extension PresentLoading{
  
  //MARK: - Inition
  convenience init(viewController: LoadingViewController) {
    self.init()
    self.VC = viewController
  }
}

