//
//  SetupStream.swift
//  ChurchApp
import UIKit
import AVKit

class SetupStream: Controller {
  
  //MARK: - Public variable
  public var VC: StreamViewController!
  
  public func viewDidLoad() {
//    self.videoView()
//    self.playPauseButton()
//    self.videoTimeSlider()
//    self.addObserverReturnTimeVideoPalyer()
    self.videoPlayerYoutibe()
  }
}
//MARK: - Private functions
extension SetupStream {
  
  private func videoPlayerYoutibe(){
    guard let videoURL = self.VC.streamData?.worship?.stream else { return }
    guard let url = URL(string: videoURL) else { return }
    self.VC.videoPlayerYoutibe.loadVideoURL(url)
  }
  //MARK: - Setup Video
  private func videoView(){
    self.VC.activityIndicator.show(true)
    guard let videoURL = self.VC.streamData?.worship?.stream else { return }
    self.VC.videoView.video(url: .network(videoURL), type: .mp3)
    self.VC.videoView.setup.playerLayer.backgroundColor = UIColor.black.cgColor
    self.VC.videoView.contentMode = .scaleAspectFit
    self.VC.videoView.setup.gravity(.resizeAspect, .resizeAspect)
  }
  public func addObserverReturnTimeVideoPalyer(){
    self.VC.videoView.controll.observerReturnTime = { (time) in
      //3 - set value slider
      self.VC.controllers.present.videoTimeSlider(currentTime: time)
      //4 - set time begin label
      self.VC.controllers.present.videoTimeStart(currentTime: time)
      //5 - set time end label
      self.VC.controllers.present.videoTimeEnd()
    }
  }
  public func readyVideoPlay(){
    self.VC.videoView.controll.observerReady = { (ready) in
      if ready {
        self.VC.videoView.isUserInteractionEnabled = true
        self.VC.activityIndicator.show(false)
        self.VC.controllers.logic.playPauseButton()
        self.VC.playPauseButton.isHidden = false
      }
    }
  }
  public func playPauseButton(){
    self.VC.playPauseButton.isHidden = true
  }
  public func videoTimeSlider(){
    self.VC.videoTimeSlider.setThumbImage(#imageLiteral(resourceName: "videoSliderTime"), for: .normal)
    self.VC.videoTimeSlider.setThumbImage(#imageLiteral(resourceName: "videoSliderTime"), for: .selected)
    self.VC.videoTimeSlider.setThumbImage(#imageLiteral(resourceName: "videoSliderTime"), for: .highlighted)
    self.VC.videoTimeSlider.value = 0
  }
}
//MARK: - Initial
extension SetupStream{
  
  //MARK: - Inition
  convenience init(viewController: StreamViewController) {
    self.init()
    self.VC = viewController
  }
}

