//
//  AnimationCard.swift
//  ChurchApp
//
//  Created by Senior Developer on 27.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class AnimationCard {
  
  var timeAnimation: CADisplayLink!
  
  private var animator    = UIViewPropertyAnimator(duration: 5, curve: .easeInOut)
  private let mainView    : UIView!
  private let animateView : UIView!
  private var stateAnimate: StateAnimate = .down
  
  public func tapGesture(gesture: UITapGestureRecognizer){
    
  }
  
  public func panGesture(gesture: UIPanGestureRecognizer){
    
    switch gesture.state {
      case .began:
        if self.animator.pausesOnCompletion {
          self.down()
        } else {
          self.up()
      }
      
      case .changed:
        if gesture.translation(in: self.mainView).y > 0 {
          self.animator.fractionComplete -= 0.03
        } else {
          self.animator.fractionComplete += 0.03
      }
      case .ended:
        self.timeAnimation = CADisplayLink(target: self, selector: #selector(self.completed))
        self.timeAnimation.add(to: .main, forMode: .common)
      
      default:
        break
    }
    print(gesture.translation(in: self.mainView) ," common view translation")
    print(gesture.velocity(in: self.mainView)    ,"velocity")
    print(gesture.translation(in: self.mainView) ,"descriptionView view translation")
  }
  public func up(){
    self.animator.addAnimations {
      //let screenHeight = self.animateView.frame.origin.y
      self.animateView.transform = CGAffineTransform(translationX: 0, y: -500)
    }
  }
  public func down(){
    self.animator.addAnimations {
      self.animateView.transform = .identity
    }
  }
  @objc
  public func completed(){
    if self.stateAnimate == .up {
      self.animator.fractionComplete += 0.03
      guard self.animator.fractionComplete >= 1.0 else { return }
      self.timeAnimation.invalidate()
      self.timeAnimation?.remove(from: .main, forMode: .common)
      self.stateAnimate = .down
      
    } else if stateAnimate == .down {
      self.animator.fractionComplete -= 0.03
      guard self.animator.fractionComplete <= 0.0 else { return }
      self.timeAnimation.invalidate()
      self.timeAnimation?.remove(from: .main, forMode: .common)
      self.stateAnimate = .up
    }
  }
  
  enum StateAnimate {
    case up
    case down
  }
  
  init(mainView: UIView, animateView: UIView) {
    self.mainView    = mainView
    self.animateView = animateView
  }
}
