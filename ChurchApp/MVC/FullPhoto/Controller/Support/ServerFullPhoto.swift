//FullPhoto
import UIKit

class ServerFullPhoto: Controller {
  
  //MARK: - Public variable
  public var VC: FullPhotoViewController!
  
}
//MARK: - Initial
extension ServerFullPhoto {
  
  //MARK: - Inition
  convenience init(viewController: FullPhotoViewController) {
    self.init()
    self.VC = viewController
  }
}

