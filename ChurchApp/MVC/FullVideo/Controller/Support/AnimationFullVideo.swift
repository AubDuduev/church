//FullVideo
import UIKit

class AnimationFullVideo: Controller {
  
  //MARK: - Public variable
  public var VC: FullVideoViewController!
  
}
//MARK: - Initial
extension AnimationFullVideo {
  
  //MARK: - Inition
  convenience init(viewController: FullVideoViewController) {
    self.init()
    self.VC = viewController
  }
}
