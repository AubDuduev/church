//
//  LogicStart.swift
//  ChurchApp

import Foundation

class LogicStart: Controller {
  
  //MARK: - Public variable
  public var VC: StartViewController!
  
  public func viewDidLoad() {
    self.logicStartController()
  }
  
  public func page(tag: Int){
    guard self.VC.startScreens != nil, !self.VC.startScreens.isEmpty else { return }
    if (tag == 0) {
      self.VC.pageIndex -= 1
      if self.VC.pageIndex == -1 { self.VC.pageIndex = (self.VC.startScreens.count - 1) }
    } else {
      self.VC.pageIndex += 1
      if self.VC.startScreens.count == self.VC.pageIndex {
        self.VC.pageIndex = 0
        GVstoreProject.saveBool(key: .isStartScreen, value: true)
        self.changePushVC()
        return
      }
    }
    self.VC.controllers.present.dataController()
    self.VC.controllers.animation.animationPage()
  }
}
//MARK: - Private functions
extension LogicStart {
  
  private func logicStartController(){
    self.VC.controllers.server.getStartScreen { (startScreens) in
      //1 - Получаем скрины для контроллера
      self.VC.startScreens = startScreens
      //2 - Презентуем данные на контроллере
      self.VC.controllers.present.dataController()
    }
  }
  private func changePushVC(){
    switch self.VC.viewParent {
      case .OtherVC:
        self.VC.dismiss(animated: true, completion: nil)
      case .LoadingVC:
        self.VC.controllers.router.push(.registrationVC)
        
    }
  }
}
//MARK: - Initial
extension LogicStart{
  
  //MARK: - Inition
  convenience init(viewController: StartViewController) {
    self.init()
    self.VC = viewController
  }
}

