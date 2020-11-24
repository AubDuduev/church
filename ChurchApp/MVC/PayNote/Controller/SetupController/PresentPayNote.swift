//
//  PresentPayNote.swift
//  ChurchApp

import Foundation

class PresentPayNote: Controller {
  
  //MARK: - Public variable
  public var VC: PayNoteViewController!
  
  public func viewDidLoad() {
    self.payButton()
    self.backgraundImageView()
    self.commonImageView()
    self.recurrentDonation()
  }
  
  public func recurrentDonation(){
    if !GVuserData.isRecurrentDonation {
      self.VC.checkMarkButton.setImage(nil, for: .normal)
      self.VC.checkMarkButton.backgroundColor = .white
    } else {
      self.VC.checkMarkButton.setImage(#imageLiteral(resourceName: "checkMakeDonation.pdf"), for: .normal)
      self.VC.checkMarkButton.backgroundColor = .set(.buttonYellow)
    }
  }
  public func payButton(){
    self.VC.payButtonLabel.text = "Перейти к оплате (\(self.VC.order.amount ?? 0)) ₽"
  }
  public func commonImageView(){
    guard let image = self.VC.noteData.service.backgraundfon else { return }
    guard let url   = self.VC.server.urls.get(type: .store(image)).URL else { return }
    self.VC.commonImageView.isSkeletonable = true
    self.VC.commonImageView.showAnimatedGradientSkeleton()
    self.VC.commonImageView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .set(.projectBlue)))
    self.VC.commonImageView.sd_setImage(with: url) { (_, error, _, url) in
      
      if let error = error {
        print("Error load image backgraundImageView, Class: PresentPayNote", "Localized: \(error.localizedDescription)")
      } else {
        self.VC.commonImageView.hideSkeleton()
      }
    }
  }
  public func backgraundImageView(){
    guard let image = self.VC.noteData.service.backgraundfon else { return }
    guard let url   = self.VC.server.urls.get(type: .store(image)).URL else { return }
    self.VC.backgraundImageView.isSkeletonable = true
    self.VC.backgraundImageView.showAnimatedGradientSkeleton()
    self.VC.backgraundImageView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .set(.projectBlue)))
    self.VC.backgraundImageView.sd_setImage(with: url) { (_, error, _, url) in
      
      if let error = error {
        print("Error load image backgraundImageView, Class: PresentPayNote", "Localized: \(error.localizedDescription)")
      } else {
        self.VC.backgraundImageView.hideSkeleton()
      }
    }
  }
}
//MARK: - Initial
extension PresentPayNote{
  
  //MARK: - Inition
  convenience init(viewController: PayNoteViewController) {
    self.init()
    self.VC = viewController
  }
}

