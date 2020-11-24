//
//  StreamViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 14.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import YouTubePlayer
import UIKit

class StreamViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: StreamControllers!
  
  //MARK: - Public variable
  public let server      = Server()
  public var timer       : Timer!
  public var streamData  : GDStreamData!
  
  //MARK: - Outlets
  @IBOutlet weak var videoView          : VideoPlayerView!
  @IBOutlet weak var activityIndicator  : UIActivityIndicatorView!
  @IBOutlet weak var playPauseButton    : UIButton!
  @IBOutlet weak var videoTimeEndLabel  : UILabel!
  @IBOutlet weak var videoTimeBeginLabel: UILabel!
  @IBOutlet weak var videoTimeSlider    : UISlider!
  @IBOutlet weak var videoPlayerYoutibe : YouTubePlayerView!
  @IBOutlet weak var dateStreamLabel    : UILabel!
  @IBOutlet weak var timeStreamLabel    : UILabel!
  @IBOutlet weak var titleProgrammLabel : UILabel!
  @IBOutlet weak var eventProgrammLabel : UILabel!
  @IBOutlet weak var onlineLabel        : UILabel!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    self.controllers.logic.viewDidLoad()
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.controllers.logic.viewDidAppear()
  }
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    self.controllers.logic.viewDidDisappear()
  }
  private func setControllers(){
    self.controllers = StreamControllers(viewController: self)
  }
}
