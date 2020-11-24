//
//  LogicLoading.swift
//  ChurchApp

import Foundation

class LogicLoading: Controller {
  
  //MARK: - Public variable
  public var VC: LoadingViewController!
  
  public func viewDidLoad() {
    self.commonLogic()
  }
  public func viewDidAppear() {
   // self.VC.controllers.router.push(.startVC)
  }
  
}
//MARK: - Private functions
extension LogicLoading {
  
  //Общая логика загрузочного контролера
  private func commonLogic(){
    self.VC.coreData.createUserData { [weak self] in
      self?.VC.semaphoreGetUserData.signal()
    }
    self.VC.semaphoreGetUserData.wait()
    //1 - мы получаем все урлы для работы с сервера
    self.VC.controllers.server.getURls(typeURLs: self.VC.typeURLGetServer){ [unowned self] (serverURLs) in
      //сохроняем урлы
      self.saveURLsAfterGetServer(serverUrl: serverURLs)
      //2 - Из полученного урл apiURL, регистрируем пользователя
      //3 - После регистрации получаем данные пользователя и сохраняем
      //4 - Если пользователь зарегистрирован просто получаем его данные
      self.chooseWhereToGetUserData { [unowned self] in
        //5  - Передаем данные пользователя на сервер в асинхронном потоке
        DispatchQueue.main.async { //[unowned self] in
          //PATCH Deeplinks
//          self.VC.controllers.server.patchDeepLink(encodeType: .DeviceData)
//          self.VC.controllers.server.patchDeepLink(encodeType: .AppsFlyerConversion)
//          self.VC.controllers.server.patchDeepLink(encodeType: .WebID)
//          //PATCH Params
//          self.VC.controllers.server.patchParams(encodeType: .AppID)
//          self.VC.controllers.server.patchParams(encodeType: .AppsFlyerID)
//          self.VC.controllers.server.patchParams(encodeType: .AppMetricaID)
//          //PATCH Push token
//          self.VC.controllers.server.patchPushToken(encodeType: .AppMetricaPushToken)
        }
        //6 - Включаем Основной Канал (TabBar)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [unowned self] in
          self.chagePushVC()
          print(GVuserData?.token ?? "", "token")
          print(GVuserData?.userID ?? "", "userID")
        }
      }
    }
  }
  private func saveURLsAfterGetServer(serverUrl: DECServerUrl?){
    
    //Succes get user data
    if let serverUrl = serverUrl {
      //saving received from url server
      GVuserData.urlStore    = serverUrl.staticURL ?? ""
      GVuserData.apiURL      = serverUrl.apiURL    ?? ""
      GVuserData.urlWebSocet = (serverUrl.webSocetURL ?? "") + "?"
      GVuserData.tgBot       = serverUrl.tgBotURL  ?? ""
      GVuserData.awayURL     = serverUrl.awayURL
      GVuserData.policyURL   = (serverUrl.policyURL ?? "")
      GVuserData.mainVideo   = serverUrl.videoURL ?? ""
      var url = serverUrl.apiURL
      url?.removeLast()
      GVuserData.apiURLNotLastSlash = url
      PersistentService.saveContext()
    //Error user data
    } else {
      print("Error server data: class: LogicLoad ->, function: saveURLsAfterGetServer , description: Error get server user data response empty")
      AlertEK.dеfault(title: .error, message: .error)
    }
  }
  private func chooseWhereToGetUserData(completion: @escaping ClousureEmpty){
    
    //get user data
    if GVstoreProject.getBool(key: .isRegistration) {
      self.VC.controllers.server.getUserData(){ (userData) in
        //save user data
        self.saveUserDataInCoreData(userData: userData)
        completion()
      }
    //registration user
    } else {
      self.VC.controllers.server.registrationUser(){ (userData) in
        //save user data
        self.saveUserDataInCoreData(userData: userData)
        completion()
      }
    }
  }
  private func saveUserDataInCoreData(userData: CODUserData){
    
    GVuserData.userID     = String(userData.ID ?? 0)
    GVuserData.userLink   = userData.userLink
    GVuserData.mode       = Int16(userData.mode ?? 0)
    GVuserData.isBlock    = userData.isBlock
    GVuserData.name       = userData.firstName
    GVuserData.secondName = "Имя"
    GVuserData.number     = userData.phone
    GVuserData.token      = userData.token
    GVuserData.tokenCP    = userData.tokenCP
    GVuserData.avatarURL  = userData.avatar
    GVuserData.returnCashActive = true
    GVstoreProject.saveBool(key: .isRegistration, value: true)
    PersistentService.saveContext()
  }
  private func chagePushVC(){
    if GVstoreProject.getBool(key: .isStartScreen) {
      self.VC.controllers.router.push(.tabBarVC)
    } else {
      self.VC.controllers.router.push(.startVC)
    }
  }
}
//MARK: - Initial
extension LogicLoading{
  
  //MARK: - Inition
  convenience init(viewController: LoadingViewController) {
    self.init()
    self.VC = viewController
  }
}

