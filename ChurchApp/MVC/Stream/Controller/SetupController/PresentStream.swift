//
//  PresentStream.swift
//  ChurchApp
import AVKit
import Foundation

class PresentStream: Controller {
  
  //MARK: - Public variable
  public var VC: StreamViewController!
  
  
  
  public func changeValueSlider(slider: UISlider){
    let slider  = slider.value
    let seconds = self.VC.videoView.player.duration()?.seconds ?? 0
    let value   = CMTimeValue(slider * seconds)
    let seeTime = CMTime(value: value, timescale: 1)
    self.VC.videoView.player.seek(to: seeTime)
  }
  public func videoTimeEnd(){
    guard self.VC.videoView.controll.isPlay else { return }
    let second = self.VC.videoView.player.duration()?.second ?? 0
    let minuts = self.VC.videoView.player.duration()?.minuts ?? 0
    self.VC.videoTimeEndLabel.text = String(format: .format(.two), minuts, second)
  }
  public func videoTimeStart(currentTime: CMTime){
    guard self.VC.videoView.controll.isPlay else { return }
    let seconds = CMTimeGetSeconds(currentTime)
    let second  = Int(seconds) % 60
    let minuts  = Int(seconds) / 60
    self.VC.videoTimeBeginLabel.text = String(format: .format(.two), minuts, second)
  }
  public func videoTimeSlider(currentTime: CMTime){
    let currentSeconds = Float(CMTimeGetSeconds(currentTime))
    let tottalSeconds  = self.VC.videoView.player.duration()?.seconds ?? 0
    let sliderValue    = Float(currentSeconds / tottalSeconds)
    self.VC.videoTimeSlider.value = sliderValue
    guard sliderValue == 1.0 else { return }
    self.VC.videoTimeSlider.value = 0
    self.VC.videoView.controll.pause()
  }
  public func streamData(){
    let worship = self.VC.streamData.worship
    self.VC.dateStreamLabel.text    = Double(worship?.date ?? 0).format(.dayMonthText)
    self.VC.timeStreamLabel.text    = Double(worship?.date ?? 0).format(.time)
    self.VC.eventProgrammLabel.text = worship?.event
    self.VC.titleProgrammLabel.text = worship?.program?.first?.title
  }
}
//MARK: - Initial
extension PresentStream{
  
  //MARK: - Inition
  convenience init(viewController: StreamViewController) {
    self.init()
    self.VC = viewController
  }
}

