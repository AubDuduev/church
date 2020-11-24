//FullPhoto
import UIKit

class AnimationFullPhoto: Controller {
  
  //MARK: - Public variable
  public var VC: FullPhotoViewController!
  
}
//MARK: - Initial
extension AnimationFullPhoto {
  
  //MARK: - Inition
  convenience init(viewController: FullPhotoViewController) {
    self.init()
    self.VC = viewController
  }
}
