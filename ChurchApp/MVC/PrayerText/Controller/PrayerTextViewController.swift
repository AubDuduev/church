//
//  PrayerTextViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 09.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class PrayerTextViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: PrayerTextControllers!
  
  //MARK: - Public variable
  public var prayerText: GDPrayerText!
  
  //MARK: - Outlets
  @IBOutlet weak var navBarTitleLabel: UILabel!
  @IBOutlet weak var contentTextView : UITextView!
  @IBOutlet weak var editTextButton  : UIButton!
  @IBOutlet weak var textViewView    : UIView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
      super.viewDidLoad()
      self.setControllers()
      self.controllers.present.viewDidLoad()
    }
  private func setControllers(){
    self.controllers = PrayerTextControllers(viewController: self)
  }
}
