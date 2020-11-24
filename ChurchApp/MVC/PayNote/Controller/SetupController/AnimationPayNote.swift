//
//  AnimationPayNote.swift
//  ChurchApp

import UIKit

class AnimationPayNote: Controller {
  
  //MARK: - Public variable
  public var VC: PayNoteViewController!
  
  public func viewDidLoad() {
    //self.changeDaysView()
  }
  
  public func changeDaysView(){
   UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
      self.VC.changeDaysView.alpha    = GVuserData.isRecurrentDonation ? 1 : 0
      self.VC.changeDaysView.isHidden = !GVuserData.isRecurrentDonation
      self.VC.view.layoutIfNeeded()
    })
  }
}
//MARK: - Initial
extension AnimationPayNote{
  
  //MARK: - Inition
  convenience init(viewController: PayNoteViewController) {
    self.init()
    self.VC = viewController
  }
}

