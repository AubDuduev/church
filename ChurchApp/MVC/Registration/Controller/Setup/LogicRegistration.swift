//
//  LogicRegistration.swift
//  ChurchApp
import SwiftEntryKit
import Foundation

class LogicRegistration: Controller {
  
  //MARK: - Public variable
  public var VC: RegistrationViewController!
  
  public func infoView(){
    SwiftEntryKit.display(entry: self.VC.infoChurcheView, using: self.VC.attributesICV)
    self.VC.infoChurcheButton.setImage(#imageLiteral(resourceName: "closeInfoRegistration.pdf"), for: .normal)
  }
}
//MARK: - Initial
extension LogicRegistration{
  
  //MARK: - Inition
  convenience init(viewController: RegistrationViewController) {
    self.init()
    self.VC = viewController
  }
}

