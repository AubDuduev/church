//
//  MainTabBarController.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
  
  //MARK: - Controllers
  public var controllers: MainTabBarControllers!
  public let server     = Server()
  
  //MARK: - Public variable
   public let safeAreaBottomView = SafeAreaBottomView().loadNib()
   public let safeAreaTopView    = SafeAreaTopView().loadNib()
   public let tabBarView         = TabBarView().loadNib()
   public let navBarView         = NavBarView().loadNib()
  
  //MARK: - Outlets
 
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.controllers.setup.viewWillAppear()
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
   
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.controllers.setup.viewDidLayoutSubviews()
  }
  private func setControllers(){
    self.controllers = MainTabBarControllers(viewController: self)
  }
}
