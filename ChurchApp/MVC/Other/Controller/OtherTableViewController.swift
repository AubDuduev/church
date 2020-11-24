//
//  OtherTableViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 27.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class OtherTableViewController: UITableViewController {
  
  //MARK: - Controllers
  public var controllers: OtherTableControllers!
  
  //MARK: - Public variable
  public var server = Server()
  
  //MARK: - Outlets
  @IBOutlet weak var avatarImageView : UIImageView!
  
  //MARK: - Arrays outlets
  @IBOutlet var cellCommonViews: [UIView]!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.controllers.present.viewDidAppear()
  }
  private func setControllers(){
    self.controllers = OtherTableControllers(viewController: self)
  }
}
