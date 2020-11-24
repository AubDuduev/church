//FullPhoto
import UIKit

class LogicFullPhoto: Controller {
	
	//MARK: - Public variable
	public var VC: FullPhotoViewController!
	
  
}
//MARK: - Initial
extension LogicFullPhoto {
	
	//MARK: - Inition
	convenience init(viewController: FullPhotoViewController) {
		self.init()
		self.VC = viewController
	}
}
