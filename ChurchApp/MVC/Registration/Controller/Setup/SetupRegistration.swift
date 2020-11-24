//
//  SetupRegistration.swift
//  ChurchApp
import SwiftEntryKit
import Foundation

class SetupRegistration: Controller {
  
  //MARK: - Public variable
  public var VC: RegistrationViewController!
  
  public func viewDidLoad() {
    self.registrationView()
    self.infoChurcheView()
  }
}
//MARK: - Private functions
extension SetupRegistration {
  
  private func registrationView(){
    self.VC.registrationButtonView.cornerRadius(5, true)
    self.VC.registrationButtonView.borderColor(.white, 0.5)
  }
  private func infoChurcheView(){
    self.VC.infoChurcheView.cornerRadius(18, true)
    self.VC.infoChurcheView.shadowColor(color: .lightGray, radius: 7)
    self.VC.attributesICV.name              = "Info"
    self.VC.attributesICV.displayMode       = .dark
    self.VC.attributesICV.shadow            = .active(with: .init(opacity: 3, radius: 5))
    self.VC.attributesICV.position          = .bottom
    self.VC.attributesICV.displayDuration   = .infinity
    let widthConstraint                     = EKAttributes.PositionConstraints.Edge.ratio(value: 0.9)
    let heightConstraint                    = EKAttributes.PositionConstraints.Edge.constant(value: 400)
    self.VC.attributesICV.positionConstraints = .init(verticalOffset   : -50,
                                                                size   : .init(width: widthConstraint,
                                                                              height: heightConstraint),
                                                                maxSize: .intrinsic)
    self.VC.attributesICV.roundCorners      = .all(radius: 18)
    var action: EKAttributes.UserInteraction.Action!
    action = { 
      self.VC.infoChurcheButton.setImage(#imageLiteral(resourceName: "infoRegistration.pdf"), for: .normal)
    }
    self.VC.attributesICV.screenInteraction = .init(defaultAction: .dismissEntry, customTapActions: [action])
    self.VC.attributesICV.entryInteraction  = .absorbTouches
    self.VC.attributesICV.scroll            = .enabled(swipeable: false, pullbackAnimation: .jolt)
    let offset = EKAttributes.PositionConstraints.KeyboardRelation.Offset(bottom: 70, screenEdgeResistance: 50)
    let keyboardRelation = EKAttributes.PositionConstraints.KeyboardRelation.bind(offset: offset)
    self.VC.attributesICV.positionConstraints.keyboardRelation = keyboardRelation
  }
}
//MARK: - Initial
extension SetupRegistration{
  
  //MARK: - Inition
  convenience init(viewController: RegistrationViewController) {
    self.init()
    self.VC = viewController
  }
}

