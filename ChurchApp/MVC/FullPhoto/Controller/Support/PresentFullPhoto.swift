//FullPhoto
import UIKit

class PresentFullPhoto: Controller {
  
  //MARK: - Public variable
  public var VC: FullPhotoViewController!
  
  public func viewDidLoad(){
    self.setImage()
  }
}

//MARK: - Private functions
extension PresentFullPhoto {
  
  public func setImage(){
    self.VC.fullImageView.image = self.VC.fullImage
  }
}
//MARK: - Initial
extension PresentFullPhoto {
  
  //MARK: - Inition
  convenience init(viewController: FullPhotoViewController) {
    self.init()
    self.VC = viewController
  }
}

