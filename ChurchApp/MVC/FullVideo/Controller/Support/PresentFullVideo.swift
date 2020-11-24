//FullVideo
import UIKit

class PresentFullVideo: Controller {
  
  //MARK: - Public variable
  public var VC: FullVideoViewController!
  
}
//MARK: - Initial
extension PresentFullVideo {
  
  //MARK: - Inition
  convenience init(viewController: FullVideoViewController) {
    self.init()
    self.VC = viewController
  }
}

