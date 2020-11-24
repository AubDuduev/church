//
//  ChangePay.swift
//  ChurchApp
//
//  Created by Senior Developer on 21.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ChangePay {
  
  let controllers: NoteControllers!
  
  public func change(){
    if  GVuserData.tokenCP != nil {
      
    } else {
      
    }
  }
  
  private func webView(){
    let webContentVC = controllers.vc.getVCForID(storyboardID     : .WebContent,
                                                 vcID             : .WebContentVC,
                                                 transitionStyle  : .crossDissolve,
                                                 presentationStyle: .fullScreen) as! WebContentViewController
    //webContentVC.activeUrl = activeUrl
    controllers.vc.present(webContentVC, animated: true)
  }
  init(controllers: NoteControllers) {
    self.controllers = controllers
  }
//  init(controllers: MakeDonationControllers) {
//    self.controllers = controllers
//  }
}
