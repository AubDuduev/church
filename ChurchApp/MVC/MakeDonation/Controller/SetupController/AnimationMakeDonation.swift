//
//  AnimationMakeDonation.swift
//  ChurchApp

import UIKit

class AnimationMakeDonation: Controller {
  
  //MARK: - Public variable
  public var VC: MakeDonationViewController!
  
  public func viewDidLoad() {
    self.changeDaysView()
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
extension AnimationMakeDonation{
  
  //MARK: - Inition
  convenience init(viewController: MakeDonationViewController) {
    self.init()
    self.VC = viewController
  }
}

