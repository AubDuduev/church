//
//  FullPhoto.swift
//  DgBetTrip
//
//  Created by Senior Developer on 29.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

class FullPhotoViewController: UIViewController {
	
	//MARK: - Controllers
	public var controllers: FullPhotoControllers!
  
  //MARK: - Public variable
  public var fullImage: UIImage!
  
  //MARK: - Outlets
  @IBOutlet weak var fullImageView: UIImageView!
  
	//MARK: - LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
    self.setControllers()
    self.controllers.present.viewDidLoad()
	}
  private func setControllers(){
    self.controllers = FullPhotoControllers(viewController: self)
  }
}




