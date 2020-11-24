//
//  FullVideo.swift
//  DgBetTrip
//
//  Created by Senior Developer on 04.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

class FullVideoViewController: UIViewController {
	
	//MARK: - Controllers
	public var controllers: FullVideoControllers!
  
  //MARK: - Public variable
  public var fullVideoURL: String?
  public let server      = Server()
  
  //MARK: - Outlets
  @IBOutlet weak var videoView             : VideoPlayerView!
  @IBOutlet weak var activityIndicatorVideo: UIActivityIndicatorView!
  @IBOutlet weak var playPauseButtonLabel  : UIButton!
  
	//MARK: - LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
	}
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    self.controllers.logic.viewDidDisappear()
  }
  private func setControllers(){
    self.controllers = FullVideoControllers(viewController: self)
  }
}




