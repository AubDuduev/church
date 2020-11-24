//FullVideo
import UIKit
import AVKit

class LogicFullVideo: Controller {
	
	//MARK: - Public variable
	public var VC: FullVideoViewController!
	
  public func viewDidDisappear() {
    self.VC.videoView.controll.pause()
  }
  //MARK: - Observer return time video player
  public func addObserverReturnTimeVideoPalyer(){
    self.VC.videoView.controll.observerReturnTime = { (time) in
      let secondsBegin = CMTimeGetSeconds(time)
      if let duration = self.VC.videoView.player.currentItem?.duration {
        let secondsEnd = CMTimeGetSeconds(duration)
        self.changeValueSlaider(sliderValue: 0)
        if secondsEnd == secondsBegin {
          let seeTime = CMTime(value: 0, timescale: 1)
          self.VC.videoView.player.seek(to: seeTime)
          self.VC.videoView.controll.pause()
        }
      }
    }
  }
  public func changeValueSlaider(sliderValue: Float){
    if let duration = self.VC.videoView.player.currentItem?.duration {
      let totalSeconds = CMTimeGetSeconds(duration)
      guard !totalSeconds.isNaN else { return }
      let value   = CMTimeValue(sliderValue * Float(totalSeconds))
      let seeTime = CMTime(value: value, timescale: 1)
      self.VC.videoView.player.seek(to: seeTime)
    }
  }
  //MARK: - Observer return time video player
  public func addObserverIsReadyVideo(){
    self.VC.videoView.controll.observerReady = { (ready) in
      if ready {
        self.VC.activityIndicatorVideo.show(false)
        self.VC.videoView.controll.play()
      }
    }
  }
  //MARK: - play pause video
  public func playPauseVideo(){
    if self.VC.videoView.controll.isPlay {
      self.VC.videoView.controll.pause()
      self.VC.playPauseButtonLabel.setImage(#imageLiteral(resourceName: "playVideo"), for: .normal)
    } else {
      self.VC.videoView.controll.play()
      self.VC.playPauseButtonLabel.setImage(#imageLiteral(resourceName: "pauseVideo"), for: .normal)
    }
  }
}
//MARK: - Initial
extension LogicFullVideo {
	
	//MARK: - Inition
	convenience init(viewController: FullVideoViewController) {
		self.init()
		self.VC = viewController
	}
}
