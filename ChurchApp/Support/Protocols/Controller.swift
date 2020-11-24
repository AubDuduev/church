//
//  Controller.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

@objc(Controller)
protocol Controller {
  
  @objc optional func viewDidLoad()
  @objc optional func viewWillAppear()
  @objc optional func viewDidAppear()
  @objc optional func viewWillDisappear()
  @objc optional func viewDidDisappear()
  @objc optional func viewDidLayoutSubviews()
  @objc optional func viewWillLayoutSubviews()
	
}

