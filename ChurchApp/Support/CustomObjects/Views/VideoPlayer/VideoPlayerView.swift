//
//  VideoPlayer.swift
//  DgBetTrip
//
//  Created by Senior Developer on 03.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit
import AVKit

class VideoPlayerView: UIView {
  
  //MARK: - Private
  private let changeURL     = ChangeUrlVideo()
  public var videoGravity   : AVLayerVideoGravity    = .resizeAspectFill
  public var contentsGravity: CALayerContentsGravity = .resizeAspectFill
  
  //MARK: -Public
  public var playerLayer = AVPlayerLayer()
  public var player      = AVPlayer()
  public let controll    = VideoControll()
  public let setup       = SetupVideoPlayer()
  
  
  public func video(url: TypeVideoURL, type: TypeVideo = .mp4){
    //create url video
    guard let url = changeURL.change(typeVideoURL: url, typeVideo: type) else { return }
    //cretae video
    self.player      = AVPlayer(url: url)
    self.playerLayer = AVPlayerLayer(player: self.player)
    //add video player
    self.layer.addSublayer(self.playerLayer)
    //setup video controll
    self.controll.setup(player: self.player, playerLayer: self.playerLayer)
    //setup
    self.setup.setup(playerLayer, videoGravity, contentsGravity)
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    self.playerLayer.frame           = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    self.playerLayer.videoGravity    = self.videoGravity
    self.playerLayer.contentsGravity = self.contentsGravity
    self.setup.corner()
  }
}
