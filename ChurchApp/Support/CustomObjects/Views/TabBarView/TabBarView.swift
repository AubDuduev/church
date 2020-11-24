//
//  TabBarView.swift
//  UmmaSPB
//
//  Created by Aleksandr on 16.02.2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//
import UIKit

class TabBarView: UIView {
  
  public var actions: Clousure<Int>!
  
  private var controllers          : MainTabBarControllers!
  private let errorHandlerWorships = ErrorHandlerWorships()
  private var timerStrieam: CADisplayLink!
  
  //MARK: - Outlets
  @IBOutlet weak var commonStackView   : UIStackView!
  @IBOutlet weak var streamIdicatorView: UIView!
  
  //MARK: - Array outlets
  @IBOutlet var iconsImageViews  : [UIImageView]!
  @IBOutlet var iconsViews       : [UIView]!
  @IBOutlet var titleLabels      : [UILabel]!
  @IBOutlet var buttonLabels     : [UIButton]!
  @IBOutlet var sectionStackViews: [UIStackView]!
 
  
  //MARK: - Outlets Constraint
  @IBOutlet weak var topCommonStackViewConstant: NSLayoutConstraint!
  @IBOutlet var heightLabelsConstant           : [NSLayoutConstraint]!
  
  public func setup(controllers: MainTabBarControllers){
    self.controllers = controllers
    //Stack view
    self.topCommonStackViewConstant.constant = 15
    self.sectionStackViews.forEach { $0.spacing = 12 }
    //Labels
    self.titleLabels.forEach { $0.text = TabBarText.allCases[$0.tag].rawValue }
    self.titleLabels.forEach { $0.font = .set(.rubikRegular, 15) }
    self.heightLabelsConstant.forEach {$0.constant = 20 }
    //Images
    self.iconsImageViews.forEach { $0.tintColor = .set(.themeOne)}
    self.iconsImageViews.forEach { $0.image     = UIImage(named: TabBarImage.allCases[$0.tag].rawValue )}
    //Backgraund
    self.iconsImageViews.forEach{ $0.backgroundColor = .set(.tabBarFon)}
    self.titleLabels.forEach{ $0.backgroundColor     = .set(.tabBarFon)}
    self.iconsViews.forEach{ $0.backgroundColor      = .set(.tabBarFon)}
    self.backgroundColor = .set(.tabBarFon)
    self.shadowColor(color: .set(.tabBarFon), radius: 7)
    //Настроика анимации индикатора стримов
    self.setupGetWorships()
  }
  private func animationClick(tag: Int){
    UIView.animate(withDuration: 1, delay: 0,
                   usingSpringWithDamping: 0.5,
                   initialSpringVelocity: 1.0,
                   options: .curveEaseInOut, animations: { [unowned self] in
      //Images set color
      self.iconsImageViews.forEach { $0.tintColor = .set(.tabBarNoClick)}
      self.iconsImageViews.forEach { $0.alpha     = 0.5}
      self.iconsImageViews[tag].tintColor         = .set(.tabBarClick)
      self.iconsImageViews[tag].alpha             = 1
      self.iconsImageViews[3].alpha               = 1
      //Label set color
      self.titleLabels.forEach { $0.textColor    = .set(.tabBarNoClick)}
      self.titleLabels.forEach { $0.alpha        = 0.5}
      self.titleLabels[tag].textColor            = .set(.tabBarClick)
      self.titleLabels[tag].alpha                = 1
    })
  }
  private func setupGetWorships(){
    //1 - Получаем список служб
    self.controllers.server.getWorships { [weak self] (worships) in
      guard let self = self else { return }
      //2 - Проверяем на ошибки
      guard self.errorHandlerWorships.check(worships: worships) else { return }
      //3 - Запускаем таимер если есть стримы
      if let _ = worships.filter({ ($0.streamInfo?.status ?? .OffLine) == .OnLine }).first {
        self.setupStreamAnimation()
      } else {
        if self.timerStrieam != nil {
          self.timerStrieam.invalidate()
          self.timerStrieam = nil
        }
      }
    }
  }
  private func setupStreamAnimation(){
    guard self.timerStrieam == nil else { return }
    let selector = #selector(self.setupStream)
    self.timerStrieam = CADisplayLink(target: self, selector: selector)
    self.timerStrieam.add(to: RunLoop.main, forMode: .common)
    self.timerStrieam.preferredFramesPerSecond = 1
  }
  @objc
  private func setupStream(){
    UIView.animate(withDuration          : 0.5,
                   delay                 : 0,
                   usingSpringWithDamping: 0.5,
                   initialSpringVelocity : 1.0, options: .curveLinear) { [weak self] in
      guard let self = self else { return }
      self.streamIdicatorView.alpha = (self.streamIdicatorView.alpha == 0) ? 1 : 0
    }
  }
  @IBAction func actionButton(button: UIButton){
    self.actions?(button.tag)
    self.animationClick(tag: button.tag)
    //Получаем список служб для включения анимации стрима
    self.setupGetWorships()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}


