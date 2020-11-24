//
//  PresentEditText.swift
//  ChurchApp

import Foundation

class PresentEditText: Controller {
  
  //MARK: - Public variable
  public var VC: EditTextViewController!
  
  
}
//MARK: - Initial
extension PresentEditText{
  
  //MARK: - Inition
  convenience init(viewController: EditTextViewController) {
    self.init()
    self.VC = viewController
  }
}

