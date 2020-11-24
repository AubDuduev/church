//
//  SetupVideoPlayer.swift
//  DgBetTrip
//
//  Created by Senior Developer on 03.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation
import AVKit

class SetupVideoPlayer {
  
  
  private var videoGravity   : AVLayerVideoGravity    = .resizeAspect
  private var contentsGravity: CALayerContentsGravity = .resizeAspect
  
  public var cornerRadius    : CGFloat = 0
  public var playerLayer     : AVPlayerLayer!
  
  public func setup(_ playerLayer: AVPlayerLayer, _ videoG: AVLayerVideoGravity, _ contentsG: CALayerContentsGravity){
    self.playerLayer                 = playerLayer
    self.playerLayer.videoGravity    = videoG
    self.playerLayer.contentsGravity = contentsG
  }
  public func corner(){
    self.playerLayer?.cornerRadius  = cornerRadius
    self.playerLayer?.masksToBounds = true
  }
  public func remove(){
    self.playerLayer?.removeFromSuperlayer()
  }
  public func gravity(_ videoG: AVLayerVideoGravity, _ contentsG: CALayerContentsGravity){
    self.playerLayer?.videoGravity    = videoG
    self.playerLayer?.contentsGravity = contentsG
  }
}
