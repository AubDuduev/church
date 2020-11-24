//
//  AnimationDonations.swift
//  ChurchApp

import UIKit

class AnimationDonations: Controller {
  
  //MARK: - Public variable
  public var VC: DonationsViewController!
  
  public func viewDidLayoutSubviews() {
   
  }
  
  public func tapGesture(gesture: UITapGestureRecognizer){
    self.VC.animationControllCard.tapGesture(gesture: gesture)
  }
  public func animationProgressCircle(gradus: CGFloat){
    self.VC.progressChartView.createCircle(gradus: gradus)
    self.VC.progressChartView.animation()
  }
  public func panGesture(gesture: UIPanGestureRecognizer){
    self.VC.animationControllCard.panGesture(gesture: gesture)
  }
}
//MARK: - Initial
extension AnimationDonations{
  
  //MARK: - Inition
  convenience init(viewController: DonationsViewController) {
    self.init()
    self.VC = viewController
  }
}

