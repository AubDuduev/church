//
//  ServerMakeDonation.swift
//  ChurchApp

import Foundation

class ServerMakeDonation: Controller {
  
  //MARK: - Public variable
  public var VC: MakeDonationViewController!
  
  public func createOrder(order: ENCOrder, completion: @escaping Clousure<DECOrder?>){
    //Request
    self.VC.server.request(requestType: .POSTOrder, data: order) { [weak self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerNote ->, function: createOrder -> data: DECOrder ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self?.createOrder(order: order, completion: completion)
          }
        //Susses
        case .object(let object):
          let order = object as! DECOrder
          completion(order)
          print("Succesful data: class: ServerNote ->, function: createOrder ->, data: DECOrder")
        
      }
    }
  }
}
//MARK: - Initial
extension ServerMakeDonation{
  
  //MARK: - Inition
  convenience init(viewController: MakeDonationViewController) {
    self.init()
    self.VC = viewController
  }
}

