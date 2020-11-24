//
//  ServerLoading.swift
//  ChurchApp

import Foundation

class ServerLoading: Controller {
  
  //MARK: - Public variable
  public var VC: LoadingViewController!
  
  //Registration new user and get url for work API
   public func getURls(typeURLs: URLString.Url, completion: @escaping Clousure<DECServerUrl>){
     //Request
     self.VC.server.request(requestType: .GETServerUrl, data: typeURLs) { (serverResult) in
       //Response
       switch serverResult {
         case .error(let error):
           print("Error server data: class: ServerLoading, function: getURls, data: DECServerUrl, description: ", error!.localizedDescription)
           AlertEK.dеfault(title: .error, message: .noJSON){
             self.getURls(typeURLs: typeURLs){ (serverURLs) in
               completion(serverURLs)
             }
         }
         //Susses
         case .object(let object):
           let serverURLs = object as! DECServerUrl
           print("Succesful data: class: ServerLoading ->, function: getURls ->, data: DECServerUrl")
           completion(serverURLs)
       }
     }
   }
   public func registrationUser(completion: @escaping Clousure<CODUserData>){
     //Request
     self.VC.server.request(requestType: .POSTRegistration) { (serverResult) in
       //Response
       switch serverResult {
         case .error(let error):
           print("Error server data: class: ServerLoading ->, function: registrationUser -> data: DECUserData->, description: ", error!.localizedDescription)
           AlertEK.dеfault(title: .error, message: .noJSON){
             self.VC.controllers.logic.viewDidLoad()
           }
         //Susses
         case .object(let object):
           let userData = object as! CODUserData
           print("Succesful data: class: ServerLoading ->, function: registrationUser ->, data: DECUserData")
           completion(userData)
       }
     }
   }
   public func getUserData(completion: @escaping Clousure<CODUserData>){
     //Request
     self.VC.server.request(requestType: .GETUserData) { (serverResult) in
       //Response
       switch serverResult {
         case .error(let error):
           print("Error server data: class: ServerLoad ->, function: getUserData -> data: DECUserData->, description: ", error!.localizedDescription)
           AlertEK.dеfault(title: .error, message: .noJSON){
             self.VC.controllers.logic.viewDidLoad()
           }
         //Susses
         case .object(let object):
           let userData = object as! CODUserData
           print("Succesful data: class: ServerLoad ->, function: getUserData ->, data: DECUserData")
           completion(userData)
       }
     }
   }
//   public func patchDeepLink(encodeType: URLBody.BodyType){
//     //Request
//     self.VC.server.request(requestType: .PATCHDeeplink, data: encodeType) { (serverResult) in
//       //Response
//       switch serverResult {
//         case .error(let error):
//           print("Error server data: class: ServerLoad ->, function: patchDeviceData -> data: DECDeeplink->, description: ", error!.localizedDescription)
//           Alerts.dеfault(title: .error, message: .noJSON){
//             self.VC.controllers.logic.viewDidLoad()
//           }
//         //Susses
//         case .object(let object):
//           let deeplink = object as! DECDeeplink
//           print(deeplink)
//           print("Succesful data: class: ServerLoad ->, function: patchDeviceData ->, data: DECDeeplink")
//       }
//     }
//   }
//  public func patchParams(encodeType: URLBody.BodyType){
//
//     //Request
//     self.VC.server.request(requestType: .PATCHParams, data: encodeType) { (serverResult) in
//       //Response
//       switch serverResult {
//         case .error(let error):
//           print("Error server data: class: ServerLoad ->, function: patchAppID -> data: DECParams->, description: ", error!.localizedDescription)
//           Alerts.dеfault(title: .error, message: .noJSON){
//             self.patchParams(encodeType: encodeType)
//         }
//         //Susses
//         case .object(let object):
//           let params = object as! DECParams
//           print(params)
//           print("Succesful data: class: ServerLoad ->, function: patchAppID ->, data: DECParams")
//
//       }
//     }
//   }
//
//  public func patchPushToken(encodeType: URLBody.BodyType){
//     //Request
//     self.VC.server.request(requestType: .PATCHPushToken, data: encodeType) { (serverResult) in
//       //Response
//       switch serverResult {
//         case .error(let error):
//           print("Error server data: class: ServerLoad ->, function: patchPushToken -> data: DECPushToken->, description: ", error!.localizedDescription)
//           Alerts.dеfault(title: .error, message: .noJSON){
//             self.patchPushToken(encodeType: encodeType)
//         }
//         //Susses
//         case .object(let object):
//           let pushToken = object as! DECPushToken
//           print(pushToken)
//           print("Succesful data: class: ServerLoad ->, function: patchPushToken ->, data: DECPushToken")
//
//       }
//     }
//   }
}
//MARK: - Initial
extension ServerLoading{
  
  //MARK: - Inition
  convenience init(viewController: LoadingViewController) {
    self.init()
    self.VC = viewController
  }
}

