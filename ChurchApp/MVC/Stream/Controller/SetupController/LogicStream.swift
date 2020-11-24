//
//  LogicStream.swift
//  ChurchApp
import UIKit
import AVKit

class LogicStream: Controller {
  
  //MARK: - Public variable
  public var VC: StreamViewController!
  
  public func viewDidLoad() {
    self.commonLogic()
  }
  
  public func viewDidDisappear() {
    self.VC.videoView.controll.pause()
    self.VC.videoPlayerYoutibe.pause()
    self.VC.timer?.invalidate()
  }
  public func viewDidAppear() {
    self.commonLogic()
  }
  
  public func playPauseButton(){
    if self.VC.videoView.controll.isPlay {
      self.VC.videoView.controll.pause()
    } else {
      self.VC.videoView.controll.play()
    }
    self.VC.controllers.animation.playButton()
  }
  private func videoPlayerYoutibePlay(){
    self.VC.timer = nil
    self.VC.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
      self.VC.videoPlayerYoutibe.play()
      guard self.VC.videoPlayerYoutibe.playerState == .Playing else { return }
      self.VC.timer.invalidate()
    }
  }
}
//MARK: - Private functions
extension LogicStream {
  
  public func commonLogic(){
    
    //1 - Презентуем данные
    self.videoPlayerYoutibePlay()
    self.VC.controllers.present.streamData()
  }
}
//MARK: - Initial
extension LogicStream{
  
  //MARK: - Inition
  convenience init(viewController: StreamViewController) {
    self.init()
    self.VC = viewController
  }
}

