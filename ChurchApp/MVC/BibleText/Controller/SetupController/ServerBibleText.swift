//
//  ServerBibleText.swift
//  ChurchApp

import Foundation

class ServerBibleText: Controller {
  
  //MARK: - Public variable
  public var VC: BibleTextViewController!
  
  public func getTextBible(data: BibleTextData?, completion: @escaping Clousure<DECBibleText?>){
    //Request
    self.VC.server.request(requestType: .GETBibleText, data: data) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerBibleText ->, function: getTextBible -> data: DECBibleText? ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getTextBible(data: data, completion: completion)
          }
        //Susses
        case .object(let object):
          let bibleText = object as! DECBibleText
          completion(bibleText)
          print("Succesful data: class: ServerBibleText ->, function: getTextBible ->, data: DECBibleText?")
          
      }
    }
  }
}
//MARK: - Initial
extension ServerBibleText{
  
  //MARK: - Inition
  convenience init(viewController: BibleTextViewController) {
    self.init()
    self.VC = viewController
  }
}

