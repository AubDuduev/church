//
//  VideoPlayerControl.swift
//  DgBetTrip
//
//  Created by Senior Developer on 03.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit
import AVKit

class VideoControll: NSObject {
  
  //MARK: - Private
  private var playerLayer: AVPlayerLayer!
  
  //MARK: - Public
  public var isPlay = false
  public var isMute = false
  public var player : AVPlayer!
  public var currentVolume     : Float = 0
  public var observerClousure  : Clousure<Any>!
  public var observerReady     : Clousure<Bool>!
  public var observerReturnTime: Clousure<CMTime>!
  public var observerEnd       : Clousure<Bool>!
  public var observerValue     : Clousure<Float>!
  
  public func play(){
    self.player?.play()
    self.isPlay = true
  }
  public func pause(){
    self.player?.pause()
    self.isPlay = false
  }
  public func playPause(){
    if self.isPlay {
      self.pause()
    } else {
      self.play()
    }
  }
  public func setup(player: AVPlayer, playerLayer: AVPlayerLayer) {
    self.player      = player
    self.playerLayer = playerLayer
    self.setupPlayerTimeObserver()
    self.setupReadyPlayObserver()
  }
  public func repeatPlayer(){
    let seeTime = CMTime(value: 0, timescale: 1)
    //ставим видео на начало
    self.player?.seek(to: seeTime)
  }
  public func start(){
    let seeTime = CMTime(value: 0, timescale: 1)
    //ставим видео на начало
    self.player?.seek(to: seeTime)
  }
  public func mute(){
    if !isMute {
      self.currentVolume = (self.player?.volume ?? 0)
      self.player?.volume = 0
      self.isMute = true
    } else {
      self.player?.volume = self.currentVolume
      self.isMute = false
    }
  }
  private func setupReadyPlayObserver(){
    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [unowned self] (timer) in
      print(self.playerLayer.isReadyForDisplay)
      if self.playerLayer.isReadyForDisplay {
        self.observerReady?(true)
        timer.invalidate()
      }
    self.observerReady?(false)
    }
  }
  private func setupPlayerTimeObserver(){
    player.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
    let interval = CMTime(value: 1, timescale: 2)
    player.addPeriodicTimeObserver(forInterval: interval, queue: nil) { (time) in
      self.observerReturnTime?(time)
      self.end(time: time)
      self.currentTime(time: time)
    }
  }
  private func end(time: CMTime){
    //получаем секунды из типа тимер
    let seconds = CMTimeGetSeconds(time)
    //получаем текущеее время видео ролика
    if let duration = player.currentItem?.duration {
      let durationSeconds = CMTimeGetSeconds(duration)
      let value = Float(seconds / durationSeconds)
      //если время совпродает с конечным временем ролика ввыключаем его
      guard value == 1.0 else { return }
      self.observerEnd?(true)
    }
  }
  private func currentTime(time: CMTime){
    //получаем секунды из типа тимер
    let seconds = CMTimeGetSeconds(time)
    //получаем текущеее время видео ролика
    if let duration = self.player.currentItem?.duration {
      let durationSeconds = CMTimeGetSeconds(duration)
      let currentValue = Float(seconds / durationSeconds)
      self.observerValue?(currentValue)
    }
  }
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    self.observerClousure?(change as Any)
  }
}
