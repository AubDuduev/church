//
//  LogicWebContent.swift
//  ChurchApp

import Foundation

class LogicWebContent: Controller {
  
  //MARK: - Public variable
  public var VC: WebContentViewController!
  
  public func viewDidLoad() {
    self.commonLogic()
  }
}
//MARK: - Private functions
extension LogicWebContent {
  
  public func commonLogic(){
    //1 - Настраиваем веб вью
    self.VC.webView.set(string: self.VC.activeUrl)
  }
}
//MARK: - Initial
extension LogicWebContent{
  
  //MARK: - Inition
  convenience init(viewController: WebContentViewController) {
    self.init()
    self.VC = viewController
  }
}

