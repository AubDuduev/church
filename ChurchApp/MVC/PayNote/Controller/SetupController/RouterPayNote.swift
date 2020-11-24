//
//  RouterPayNote.swift
//  ChurchApp
import Foundation

class RouterPayNote: Controller {
  
  //MARK: - Public variable
  public var VC: PayNoteViewController!
  
  public func push(_ type: Push){
    
    switch type {
      case .WebContent(let activeUrl):
        self.pushWebContent(activeUrl: activeUrl)
      case .ChoosePS(let choosePSData):
        self.pushChoosePS(choosePSData: choosePSData)
    }
  }
   
   enum Push {
     case WebContent(String?)
     case ChoosePS(ChoosePSData)
   }
}
//MARK: - Private functions
extension RouterPayNote {
  
  private func pushWebContent(activeUrl: String?){
    let webContentVC = self.VC.getVCForID(storyboardID     : .WebContent,
                                          vcID             : .WebContentVC,
                                          transitionStyle  : .crossDissolve,
                                          presentationStyle: .fullScreen) as! WebContentViewController
    webContentVC.activeUrl = activeUrl
    self.VC.present(webContentVC, animated: true)
  }
  private func pushChoosePS(choosePSData: ChoosePSData){
    let choosePSVC = self.VC.getVCForID(storyboardID     : .ChoosePS,
                                        vcID             : .ChoosePSVC,
                                        transitionStyle  : .crossDissolve,
                                        presentationStyle: .fullScreen) as! ChoosePSViewController
    choosePSVC.choosePSData = choosePSData
    choosePSVC.callBack = { [self] (returnData) in
      self.VC.controllers.logic.createDataChoosePS(returnData: returnData)
    }
    self.VC.present(choosePSVC, animated: true)
  }
}
//MARK: - Initial
extension RouterPayNote{
  
  //MARK: - Inition
  convenience init(viewController: PayNoteViewController) {
    self.init()
    self.VC = viewController
  }
}

