//
//  RouterEditText.swift
//  ChurchApp
import Foundation

class RouterEditText: Controller {
  
  //MARK: - Public variable
  public var VC: EditTextViewController!
  
  
}
//MARK: - Initial
extension RouterEditText{
  
  //MARK: - Inition
  convenience init(viewController: EditTextViewController) {
    self.init()
    self.VC = viewController
  }
}

