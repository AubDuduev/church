//FullVideo
import UIKit

class ServerFullVideo: Controller {
  
  //MARK: - Public variable
  public var VC: FullVideoViewController!
  
}
//MARK: - Initial
extension ServerFullVideo {
  
  //MARK: - Inition
  convenience init(viewController: FullVideoViewController) {
    self.init()
    self.VC = viewController
  }
}

