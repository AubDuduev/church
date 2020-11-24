//FullPhoto
import UIKit

class SetupFullPhoto: Controller {
  
  //MARK: - Public variable
  public var VC: FullPhotoViewController!
  
  
}
//MARK: - Initial
extension SetupFullPhoto {
  
  //MARK: - Inition
  convenience init(viewController: FullPhotoViewController) {
    self.init()
    self.VC = viewController
  }
}


