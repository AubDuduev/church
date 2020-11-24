//
//  RouterWorship.swift
//  ChurchApp
import UIKit

class RouterWorship: Controller {
  
  //MARK: - Public variable
  public var VC: WorshipViewController!
  
  public func push(_ type: RouterWorship.Push){
    switch type {
      
      case .fullPhoto(let image):
        self.fullPhoto(image: image)
      
      case .fullVideo(let videoURL):
        self.fullVideo(videoURL: videoURL)
      
      case .streamVideo(let streamData):
        self.streamVideo(streamData: streamData)
    }
  }
}
//MARK: - Private functions
extension RouterWorship {
  
  private func fullPhoto(image: UIImage?){
    
    guard let image = image else { return }
    let fullPhotoVC = self.VC.getVCForID(storyboardID     : .FullPhoto,
                                         vcID             : .FullPhotoVC,
                                         transitionStyle  : .crossDissolve,
                                         presentationStyle: .overCurrentContext) as! FullPhotoViewController
    fullPhotoVC.fullImage = image
    self.VC.present(fullPhotoVC, animated: true, completion: nil)
  }
  
  private func fullVideo(videoURL: String?){
    guard let videoURL = videoURL else { return }
    let fullVideoVC = self.VC.getVC(storyboardID     : .FullVideo,
                                    transitionStyle  : .crossDissolve,
                                    presentationStyle: .overCurrentContext) as! FullVideoViewController
    fullVideoVC.fullVideoURL = videoURL
    self.VC.present(fullVideoVC, animated: true, completion: nil)
  }
  private func streamVideo(streamData: GDStreamData?){
    guard let streamData = streamData else { return }
    let fullVideoVC = self.VC.getVC(storyboardID     : .Stream,
                                    transitionStyle  : .crossDissolve,
                                    presentationStyle: .overCurrentContext) as! StreamViewController
    fullVideoVC.streamData = streamData
    self.VC.present(fullVideoVC, animated: true, completion: nil)
  }
  enum Push {
    case fullVideo(String?)
    case streamVideo(GDStreamData?)
    case fullPhoto(UIImage?)
  }
}
//MARK: - Initial
extension RouterWorship{
  
  //MARK: - Inition
  convenience init(viewController: WorshipViewController) {
    self.init()
    self.VC = viewController
  }
}

