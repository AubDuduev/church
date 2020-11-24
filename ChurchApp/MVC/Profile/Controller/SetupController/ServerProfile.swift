//
//  ServerProfile.swift
//  ChurchApp

import Foundation

class ServerProfile: Controller {
  
  //MARK: - Public variable
  public var VC: ProfileViewController!
  
  public func getUserData(completion: @escaping Clousure<CODUserData?>){
    //Request
    self.VC.server.request(requestType: .GETUserData) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerProfile ->, function: getUserData -> data: CODUserData ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getUserData(completion: completion)
        }
        //Susses
        case .object(let object):
          let userData = object as? CODUserData
          completion(userData)
          print("Succesful data: class: ServerProfile ->, function: getUserData ->, data: CODUserData")
      }
    }
  }
  public func postPhotoURL(image: Data, completion: @escaping Clousure<DECPhotoURL>){
    //Request
    self.VC.server.request(requestType: .POSTPhoto, data: image) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerProfile ->, function: postPhotoURL -> data: DECPhotoURL ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .userDataUpdateError){
            self.postPhotoURL(image: image, completion: completion)
        }
        //Susses
        case .object(let object):
          let photoURL  = object as! DECPhotoURL
          completion(photoURL)
          print("Succesful data: class: ServerProfile ->, function: postPhotoURL ->, data: DECPhotoURL")
      }
    }
  }
  public func patchUserData(userData: ENCUserData,completion: @escaping Clousure<CODUserData>){
    //Request
    self.VC.server.request(requestType: .PATHUserData, data: userData) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerProfile ->, function: patchUserData -> data: CODUserData ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .userDataUpdateError){
            self.patchUserData(userData: userData, completion: completion)
          }
        //Susses
        case .object(let object):
          let userData  = object as! CODUserData
          DispatchQueue.main.async {
             completion(userData)
          }
          print("Succesful data: class: ServerProfile ->, function: patchUserData ->, data: CODUserData")
      }
    }
  }
}
//MARK: - Initial
extension ServerProfile{
  
  //MARK: - Inition
  convenience init(viewController: ProfileViewController) {
    self.init()
    self.VC = viewController
  }
}

