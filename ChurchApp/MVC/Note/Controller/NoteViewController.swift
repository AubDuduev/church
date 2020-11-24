//
//  NoteViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 26.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: NoteControllers!
  
  //MARK: - Public variable
  public let server   = Server()
  public var noteData : NoteData!
  
  //MARK: - Outlets
  @IBOutlet weak var commonView         : UIView!
  @IBOutlet weak var cornerRadiusView   : UIView!
  @IBOutlet weak var scrollContentView  : UIScrollView!
  @IBOutlet weak var createOrderButton  : UIButton!
  @IBOutlet weak var addPeopleButton    : UIButton!
  @IBOutlet weak var createOrderView    : UIView!
  @IBOutlet weak var addPeopleView      : UIView!
  @IBOutlet weak var titleNoteLabel     : UILabel!
  @IBOutlet weak var descriptionLabel   : UILabel!
  @IBOutlet weak var backgraundImageView: UIImageView!
  @IBOutlet weak var noteTable          : NoteTable!
  
  //MARK: - Outlets
  @IBOutlet var textFieldsViews: [UIView]!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    self.controllers.present.viewDidLoad()
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.controllers.logic.viewWillDisappear()
  }
  private func setControllers(){
    self.controllers = NoteControllers(viewController: self)
  }
}
