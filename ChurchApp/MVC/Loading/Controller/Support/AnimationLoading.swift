//
//  AnimationLoading.swift
//  ChurchApp
import NVActivityIndicatorView
import UIKit

class AnimationLoading: Controller {
  
  //MARK: - Public variable
  public var VC: LoadingViewController!
  
  public func viewDidLoad() {
    self.animationLoading()
  }
  public func stopAnimation(){
    self.VC.animationLoadingView.stopAnimating()
  }
}
//MARK: - Private functions
extension AnimationLoading {
  
  private func animationLoading(){
    let rect = self.VC.animationLoadingView.frame
    self.VC.animationLoadingView = NVActivityIndicatorView(frame: rect, type: .ballPulse, color: .white, padding: 10)
    self.VC.animationLoadingView.startAnimating()
    self.VC.view.addSubview(self.VC.animationLoadingView)
  }
}
//MARK: - Initial
extension AnimationLoading{
  
  //MARK: - Inition
  convenience init(viewController: LoadingViewController) {
    self.init()
    self.VC = viewController
  }
}

