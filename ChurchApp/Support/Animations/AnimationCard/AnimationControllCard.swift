//
//  AnimationControllCard.swift
//  ChurchApp
//
//  Created by Senior Developer on 27.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class AnimationControllCard {
  
  private var animator    : UIViewPropertyAnimator!
  private let mainView    : UIView!
  private let animateView : UIView!
  private var stateAnimate: StateAnimate = .down
  private let cardHeight  : CGFloat!
  private let cardHandle  : CGFloat!
  private var cardVisible = false
  
  private var nextState: StateAnimate {
    return self.cardVisible ? .up : .down
  }
  public var animatedProgress: CGFloat = 0
  
  public func tapGesture(gesture: UITapGestureRecognizer){
    self.start(state: self.nextState, duration: 0.9)
    self.completed()
  }
  
  public func panGesture(gesture: UIPanGestureRecognizer){
    
    switch gesture.state {
      case .began:
        self.start(state: self.nextState, duration: 0.9)
      case .changed:
        let translation = gesture.translation(in: self.animateView)
        var fraction = translation.y / cardHeight
        fraction = cardVisible ? fraction : -fraction
        self.update(fraction: fraction)
      case .ended:
        self.completed()
      default:
        break
    }
  }
  public func start(state: StateAnimate, duration: TimeInterval){
    //1 - если анимация не инициализирована , то инициализируем
    if self.animator == nil {
      self.transitions(state: state, duration: duration)
    }
    //3 - сохроняем текущий прогресс анимации
    if self.animator != nil {
      self.animator.pauseAnimation()
      self.animatedProgress = self.animator.fractionComplete
    }
  }
  public func update(fraction: CGFloat){
    self.animator.fractionComplete = fraction + self.animatedProgress
  }
  public func completed(){
    self.animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
  }
  public func transitions(state: StateAnimate, duration: TimeInterval){
    //2 - создаем анимацию каждый раз и взаивисимости от состояния карты поднимаем карту или опускаем
    self.animator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1, animations: {
      switch state {
        //поднимаем : устанавливаем ориджинал карты (минус 600 основного вью)
        case .down:
          self.animateView.frame.origin.y = self.mainView.frame.height - self.cardHeight
        //поднимаем : устанавливаем ориджинал карты (минус 150 основного вью)
        case .up:
          self.animateView.frame.origin.y = self.mainView.frame.height - self.cardHandle
      }
    })
    //4 - этот блок срабатывает когда анимация завершена
    //меняем состояние (какое положение у карты)
    //удаляем анимацию
    self.animator.addCompletion { (_) in
      self.cardVisible.toggle()
      self.animator = nil
    }
  }
  
  enum StateAnimate {
     case up
     case down
   }
  
  init(mainView: UIView, animateView: UIView, cardHandle: CGFloat) {
    self.mainView    = mainView
    self.animateView = animateView
    self.cardHandle  = cardHandle
    self.cardHeight  = mainView.bounds.height - 150
  }
}
