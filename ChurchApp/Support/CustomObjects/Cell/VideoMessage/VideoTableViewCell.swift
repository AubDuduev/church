//
//  VideoTableViewCell.swift
//  DgBetTrip
//
//  Created by Developer on 28.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit
import SDWebImage
import AVFoundation

class VideoTableViewCell: UITableViewCell, LoadNidoble {
  
  private let server     = Server()
  private var message    : CODMessage!
  private var controllers: Controllers!
  
  @IBOutlet weak private var playButtonLabel  : UIButton!
  @IBOutlet weak private var avatarView       : UIView!
  @IBOutlet weak private var avatarImageView  : UIImageView!
  @IBOutlet weak private var videoMessageView : VideoPlayerView!
  @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak private var dateMesageLabel  : UILabel!
  @IBOutlet weak private var userNameLabel    : UILabel!
  @IBOutlet weak private var dateMesageView   : UIView!
  @IBOutlet weak private var userNameView     : UIView!
  @IBOutlet weak private var timeMesageLabel  : UILabel!
  @IBOutlet weak private var timeMesageView   : UIView!
  
  //MARK: - Outlets constraints
  @IBOutlet weak private var videoMessageViewHeightConstarint: NSLayoutConstraint!
  @IBOutlet weak private var videoMessageViewWidthConstarint : NSLayoutConstraint!
  
  
  public func configure(controllers: Controllers?, message: CODMessage?){
    guard let message = message else { return }
    self.message     = message
    self.controllers = controllers
    self.dateMesageLabel.text = message.time?.format(.time)
    self.userNameLabel.text   = message.userData?.firstName
    self.getVideoMessage(stringURL: message.video)
    self.downLoadAvatar(urlString: message.userData?.avatar)
    self.readyVideoPlay()
    self.addTapGestures()
    self.setupTimeMesageView()
    self.setupTimeMesageLabel()
  }
  public func setupTimeMesageView(){
    
    let typeVideo = VideoSize.videoSize(messageURL: self.message.video)
    switch typeVideo {
      case .square:
        self.timeMesageView.cornerRadius(9, true)
      default:
        self.timeMesageView.isHidden = true
    }
  }
  public func setupTimeMesageLabel(){
    self.videoMessageView.controll.observerReturnTime = { [weak self] time in
      guard let self = self else { return }
      let seconds = CMTimeGetSeconds(time)
      let second  = Int(seconds) % 60
      let minuts  = Int(seconds) / 60
      self.timeMesageLabel.text = String(format: .format(.two), minuts, second)
    }
  }
  private func pushFullVideo(){
    if let chatControllers = self.controllers as? ChatControllers {
      chatControllers.router.push(.fullVideo(self.message.video))
    }
    if let newsControllers = self.controllers as? NewsControllers {
      newsControllers.router.push(.fullVideo(self.message.video))
    }
  }
  private func pauseIfPlayOtherVideo(){
    if let chatControllers = self.controllers as? ChatControllers {
      chatControllers.logic.pauseIfPlayOtherVideo(cell: self)
    }
    if let newsControllers = self.controllers as? NewsControllers {
      newsControllers.logic.pauseIfPlayOtherVideo(cell: self)
    }
  }
  //picture of the message
  private func downLoadAvatar(urlString: String?){
    let url = self.server.urls.get(type: .store(urlString)).URL
    self.avatarImageView.sd_setImage(with: url) { (_, error, _, _) in
      guard error == nil else { return }
    }
  }
  private func readyVideoPlay(){
    self.videoMessageView.controll.observerReady = { [unowned self] (ready) in
      if ready {
        self.playButtonLabel.isHidden = false
        self.videoMessageView.setup.playerLayer.backgroundColor = UIColor.set(.themeOne).cgColor
        self.activityIndicator.show(false)
        
        //запуск видео
        self.setupPlayVideo()
      }
    }
  }
  private func setupPlayVideo(){
    let typeVideo = VideoSize.videoSize(messageURL: self.message.video)
    switch typeVideo {
      case .square:
        //запуск видео
        self.videoMessageView.controll.play()
      case .araund:
        print("")
      case .none:
        print("")
    }
  }
  //Setup Video Message
  private func getVideoMessage(stringURL: String?){
    self.playButtonLabel.isHidden = true
    self.activityIndicator.show(true)
    let urlString = self.server.urls.get(type: .store(stringURL)).string
    self.videoMessageView.video(url: .network(urlString), type: .mp3)
    self.addObserverReturnTimeVideoPalyer()
  }
  private func setupVideoMessage(){
    let typeVideo = VideoSize.videoSize(messageURL: self.message.video)
    
    switch typeVideo {
      //setup if araund video
      case .araund:
        self.videoMessageView.borderColor(.white, 1)
        self.videoMessageView.cornerRadius(100, false)
        self.videoMessageView.setup.cornerRadius = 100
        self.videoMessageView.setup.corner()
        self.videoMessageView.shadowColor(color: .lightGray, radius: 5)
        self.videoMessageView.setup.playerLayer?.backgroundColor = UIColor.white.cgColor
      //setup if square video
      case .square:
        self.videoMessageView.contentMode = .scaleAspectFill
        self.videoMessageView.setup.gravity(.resizeAspectFill, .resizeAspectFill)
        self.videoMessageView.cornerRadius(9, false)
        self.videoMessageView.shadowColor(color: .lightGray, radius: 3)
        self.videoMessageView.setup.cornerRadius = 9
        self.videoMessageView.setup.corner()
      case .none:
        print("")
    }
  }
  private func setupButtonPlay(){
    self.playButtonLabel.cornerRadius(19.5, false)
    self.playButtonLabel.shadowColor(color: #colorLiteral(red: 0.2143733501, green: 0.2144159973, blue: 0.2143677473, alpha: 1), radius: 3)
    self.playButtonLabel.backgroundColor = .clear
  }
  private func addObserverReturnTimeVideoPalyer(){
    
    self.videoMessageView.controll.observerReturnTime = { (time) in
      let secondsBegin = CMTimeGetSeconds(time)
      if let duration = self.videoMessageView.player.currentItem?.duration {
        let secondsEnd = CMTimeGetSeconds(duration)
        if secondsEnd == secondsBegin {
          let seeTime = CMTime(value: 0, timescale: 1)
          self.videoMessageView.player.seek(to: seeTime)
          self.pauseVideo()
        }
      }
    }
  }
  public func pauseVideo(){
    self.videoMessageView.controll.pause()
    self.hiddenAnimationPlayButton()
  }
  @objc private func playVideoGesture(){
    if self.videoMessageView.controll.isPlay {
      self.videoMessageView.controll.pause()
    } else {
      self.videoMessageView.controll.play()
    }
    self.hiddenAnimationPlayButton()
    self.pauseIfPlayOtherVideo()
//    let typeVideo = VideoSize.videoSize(messageURL: self.message.video)
//    switch typeVideo {
//      case .square:
//        self.pushFullVideo()
//      case .araund:
//        if self.videoMessageView.controll.isPlay {
//          self.videoMessageView.controll.pause()
//        } else {
//          self.videoMessageView.controll.play()
//        }
//        self.hiddenAnimationPlayButton()
//      case .none:
//        self.pauseIfPlayOtherVideo()
//    }
  }
  private func addTapGestures(){
    let gesturePlayVideo = UITapGestureRecognizer(target: self, action: #selector(playVideoGesture))
    self.videoMessageView.addGestureRecognizer(gesturePlayVideo)
    self.videoMessageView.isUserInteractionEnabled = true
  }
  private func hiddenAnimationPlayButton(){
    if self.videoMessageView.controll.isPlay {
      UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
        self.playButtonLabel.alpha = 0
        self.playButtonLabel.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
      }){ (finishAnimation) in
        self.playButtonLabel.transform = .identity
      }
    } else {
      UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
        self.playButtonLabel.alpha = 1
        self.playButtonLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
      })
    }
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    self.videoMessageView.controll.pause()
    self.videoMessageView.setup.remove()
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    self.setupButtonPlay()
    self.setupVideoMessage()
    self.avatarView.cornerRadius(22.5, false)
    self.dateMesageView.cornerRadius(3, false)
    self.userNameView.cornerRadius(3, false)
    self.dateMesageView.shadowColor(color: .lightGray, radius: 3)
    self.userNameView.shadowColor(color: .lightGray, radius: 3)
    self.videoMessageView.isUserInteractionEnabled = true
  }
  @IBAction func playVideo(_ button: UIButton){
    if self.videoMessageView.controll.isPlay {
      self.videoMessageView.controll.pause()
    } else {
      self.videoMessageView.controll.play()
    }
    self.hiddenAnimationPlayButton()
    self.pauseIfPlayOtherVideo()
  }
}
