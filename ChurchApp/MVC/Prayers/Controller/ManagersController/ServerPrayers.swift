//
//  ServerPrayers.swift
//  ChurchApp

import Foundation

class ServerPrayers: Controller {
  
  //MARK: - Public variable
  public var VC: PrayersViewController!
  
  public func getPrays(completion: @escaping Clousure<[DECPrayer]?>){
    //Request
    self.VC.server.request(requestType: .GETPrays) { [weak self] (serverResult) in
      guard let self = self else { return }
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerPrayers ->, function: getPrays -> data: [DECPrays]? ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getPrays(completion: completion)
          }
        //Susses
        case .object(let object):
          let prays = object as? [DECPrayer]
          completion(prays)
          print("Succesful data: class: ServerPrayers ->, function: getPrays ->, data: [DECPrays]?")
          
      }
    }
  }
  public func getPrayID(id: String, completion: @escaping Clousure<DECPrayer?>){
    //Request
    self.VC.server.request(requestType: .GETPrayID, data: id) { [weak self] (serverResult) in
      guard let self = self else { return }
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerPrayers ->, function: getPrayID -> data: DECPrayer ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getPrayID(id: id, completion: completion)
          }
        //Susses
        case .object(let object):
          let prays = object as? DECPrayer
          completion(prays)
          print("Succesful data: class: ServerPrayers ->, function: getPrayID ->, data: DECPrayer")
          
      }
    }
  }
}
//MARK: - Initial
extension ServerPrayers{
  
  //MARK: - Inition
  convenience init(viewController: PrayersViewController) {
    self.init()
    self.VC = viewController
  }
}

