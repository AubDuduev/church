//
//  RouterChoosePS.swift
//  ChurchApp
import Foundation

class RouterChoosePS: Controller {
  
  //MARK: - Public variable
  public var VC: ChoosePSViewController!
  
  
}
//MARK: - Initial
extension RouterChoosePS{
  
  //MARK: - Inition
  convenience init(viewController: ChoosePSViewController) {
    self.init()
    self.VC = viewController
  }
}

