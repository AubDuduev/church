//
//  WorshipViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class WorshipViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: WorshipControllers!
  
  //MARK: - Public variable
  public let worshipCollectionViewLaytout = WorshipCollectionViewLaytout()
  public let errorHandlerWorships         = ErrorHandlerWorships()
  public let server                       = Server()
  
  //MARK: - Outlets
  @IBOutlet weak var worshipCollection    : WorshipCollection!
  @IBOutlet weak var worshipCollectionView: UICollectionView!
  @IBOutlet weak var programTable         : ProgramTable!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.controllers.logic.viewWillAppear()
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.controllers.logic.viewWillDisappear()
  }
  private func setControllers(){
    self.controllers = WorshipControllers(viewController: self)
  }
}
