//FullVideo
import UIKit

class SetupFullVideo: Controller {
  
  //MARK: - Public variable
  public var VC: FullVideoViewController!
  
  public func viewDidLoad(){
    self.setupUrlVideo()
  }
}
//MARK: - Private functions
extension SetupFullVideo {
  
  //MARK: - Setup Video
  private func setupUrlVideo(){
    self.VC.activityIndicatorVideo.show(true)
    guard let videoURL = self.VC.fullVideoURL else { return }
    let urlVideo = self.VC.server.urls.get(type: .store(videoURL)).string
    self.VC.videoView.video(url: .network(urlVideo), type: .mp3)
    self.VC.videoView.setup.playerLayer.backgroundColor = UIColor.black.cgColor
    self.VC.controllers?.logic.addObserverReturnTimeVideoPalyer()
    self.VC.controllers?.logic.addObserverIsReadyVideo()
    self.VC.videoView.contentMode = .scaleAspectFit
    self.VC.videoView.setup.gravity(.resizeAspect, .resizeAspect)
  }
  
}
//MARK: - Initial
extension SetupFullVideo {
  
  //MARK: - Inition
  convenience init(viewController: FullVideoViewController) {
    self.init()
    self.VC = viewController
  }
}


