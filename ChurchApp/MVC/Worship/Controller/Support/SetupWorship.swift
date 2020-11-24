//
//  SetupWorship.swift
//  ChurchApp
import AVKit
import UIKit

class SetupWorship: Controller {
  
  //MARK: - Public variable
  public var VC: WorshipViewController!
  
  public func viewDidLoad() {
    self.worshipCollection()
  }
}
//MARK: - Private functions
extension SetupWorship {
  
  private func worshipCollection(){
    self.VC.worshipCollection.controllers              = self.VC.controllers
    self.VC.worshipCollectionViewLaytout.sectionInset  = .init(top: 20, left: 10, bottom: 50, right: 10)
    self.VC.worshipCollectionView.collectionViewLayout = self.VC.worshipCollectionViewLaytout
  }
}
//MARK: - Setup worship cell
extension SetupWorship {
  
  public func programmTable(cell: WorshipCollectionCell){
    cell.programTableView.delegate   = self.VC.programTable
    cell.programTableView.dataSource = self.VC.programTable
  }
  public func cornerRadius(cell: WorshipCollectionCell){
    cell.contentView.cornerRadius(7, true)
    cell.commonView.cornerRadius(7, true)
    cell.cornerRadius(7, false)
    cell.shadowColor(color: .lightGray, radius: 5)
  }
}
//MARK: - Setup stream cell
extension SetupWorship {
  
  public func cornerRadius(cell: StreamCollectionCell){
    cell.commonView.cornerRadius(9, true)
    cell.contentView.cornerRadius(9, true)
    cell.cornerRadius(9, true)
    cell.shadowColor(color: .black, radius: 5)
  }
  public func addTapGestures(cell: StreamCollectionCell){
    let gesturePlayVideo = UITapGestureRecognizer(target: self, action: #selector(cell.playVideoGesture))
    cell.videoStreamView.addGestureRecognizer(gesturePlayVideo)
    cell.videoStreamView.isUserInteractionEnabled = true
  }
  public func readyVideoPlay(cell: StreamCollectionCell){
    cell.videoStreamView.controll.observerReady = { [weak cell] (ready) in
      if ready {
        cell?.playButtonLabel.isHidden = false
        cell?.videoStreamView.setup.playerLayer.backgroundColor = UIColor.set(.themeOne).cgColor
      }
    }
  }
  public func addObserverReturnTimeVideo(cell: StreamCollectionCell){
    cell.videoStreamView.controll.observerReturnTime = { [weak cell] (time) in
      let secondsBegin = CMTimeGetSeconds(time)
      if let duration = cell?.videoStreamView.player.currentItem?.duration {
        let secondsEnd = CMTimeGetSeconds(duration)
        if secondsEnd == secondsBegin {
          let seeTime = CMTime(value: 0, timescale: 1)
          cell?.videoStreamView.player.seek(to: seeTime)
          cell?.playVideo(UIButton())
        }
      }
    }
  }
}
//MARK: - Initial
extension SetupWorship{
  
  //MARK: - Inition
  convenience init(viewController: WorshipViewController) {
    self.init()
    self.VC = viewController
  }
}

