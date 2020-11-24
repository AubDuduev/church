//
//  BakeryViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 26.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class BakeryViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: BakeryControllers!
  
  //MARK: - Public variable
  public let bakeryCollectionLayout = BakeryCollectionViewLaytout()
  public let server                 = Server()
  public let errorHandlerProducts   = ErrorHandlerProducts()
  
  //MARK: - Outlets
  @IBOutlet weak var navBarView          : UIView!
  @IBOutlet weak var bakeryCollection    : BakeryCollection!
  @IBOutlet weak var bakeryCollectionView: UICollectionView!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    self.controllers.logic.viewDidLoad()
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.controllers.logic.viewWillDisappear()
  }
  private func setControllers(){
    self.controllers = BakeryControllers(viewController: self)
  }
}
