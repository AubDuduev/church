//
//  ServerDonations.swift
//  ChurchApp

import Foundation

class ServerDonations: Controller {
  
  //MARK: - Public variable
  public var VC: DonationsViewController!
  
  public func getDonations(completion: @escaping Clousure<DECDonations?>){
    //Request
    self.VC.server.request(requestType: .GETDonations) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerDonations ->, function: getDonations -> data: DECDonations ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getDonations(completion: completion)
        }
        //Succes
        case .object(let object):
          let donations  = object as? DECDonations
          completion(donations)
          print("Succesful data: class: ServerDonations ->, function: getDonations ->, data: DECDonations")
        
      }
    }
  }
}
//MARK: - Initial
extension ServerDonations{
  
  //MARK: - Inition
  convenience init(viewController: DonationsViewController) {
    self.init()
    self.VC = viewController
  }
}

