//
//  AbautViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 28.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class AbautViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: AbautControllers!
  
  //MARK: - Public variable
  
  
  //MARK: - Outlets
  @IBOutlet weak var pageControll       : UIPageControl!
  @IBOutlet weak var abautCollectionView: UICollectionView!
  @IBOutlet weak var abautCollection    : AbautCollection!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
  }
  private func setControllers(){
    self.controllers = AbautControllers(viewController: self)
  }
}
