//
//  ServerServices.swift
//  ChurchApp

import Foundation

class ServerServices: Controller {
  
  //MARK: - Public variable
  public var VC: ServicesViewController!
  
  public func getServices(completion: @escaping Clousure<[DECService]?>){
    //Request
    self.VC.server.request(requestType: .GETServices) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerServices ->, function: getServices -> data: [DECService] ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getServices(completion: completion)
        }
        //Susses
        case .object(let object):
          let services = object as? [DECService]
          completion(services)
          print("Succesful data: class: ServerServices ->, function: getServices ->, data: [DECService]")
        
      }
    }
  }
  public func getPrice(completion: @escaping Clousure<DECPrice?>){
    //Request
    self.VC.server.request(requestType: .GETPrice) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerServices ->, function: getPrice -> data: DECPrice ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getPrice(completion: completion)
        }
        //Susses
        case .object(let object):
          let services = object as? DECPrice
          completion(services)
          print("Succesful data: class: ServerServices ->, function: getPrice ->, data: DECPrice")
        
      }
    }
  }
}
//MARK: - Initial
extension ServerServices{
  
  //MARK: - Inition
  convenience init(viewController: ServicesViewController) {
    self.init()
    self.VC = viewController
  }
}

