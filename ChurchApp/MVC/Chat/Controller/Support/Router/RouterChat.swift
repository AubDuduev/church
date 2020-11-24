//
//  RouterChat.swift
//  ChurchApp
import UIKit

class RouterChat: Controller {
  
  //MARK: - Public variable
  public var VC: ChatViewController!
  
  public func push(_ type: RouterChat.Push){
    switch type {
      
      case .FullPhoto(let image):
        self.fullPhoto(image: image)
      
      case .fullVideo(let videoURL):
        self.fullVideo(videoURL: videoURL)
    }
  }
}
//MARK: - Private functions
extension RouterChat {
  
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
  
  enum Push {
    case fullVideo(String?)
    case FullPhoto(UIImage?)
  }
}
//MARK: - Initial
extension RouterChat {
  
  //MARK: - Inition
  convenience init(viewController: ChatViewController) {
    self.init()
    self.VC = viewController
  }
}

