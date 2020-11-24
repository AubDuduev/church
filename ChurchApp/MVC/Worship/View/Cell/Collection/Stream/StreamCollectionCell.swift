//
//  StreamCollectionCell.swift
//  ChurchApp
import UIKit
import AVKit
import SDWebImage

class StreamCollectionCell: UICollectionViewCell, LoadNidoble {
  
  private let server            = Server()
  private var worshipControllers: WorshipControllers!
  
  public var worship: GDWorship!
  
  @IBOutlet weak var videoStreamView   : VideoPlayerView!
  @IBOutlet weak var streamInfoView    : UIView!
  @IBOutlet weak var playButtonLabel   : UIButton!
  @IBOutlet weak var commonView        : UIView!
  @IBOutlet weak var onLineView        : UIView!
  @IBOutlet weak var streamImageView   : UIImageView!
  @IBOutlet weak var dateStreamLabel   : UILabel!
  @IBOutlet weak var timeStreamLabel   : UILabel!
  @IBOutlet weak var titleProgrammLabel: UILabel!
  @IBOutlet weak var eventProgrammLabel: UILabel!
  @IBOutlet weak var onlineLabel       : UILabel!
  @IBOutlet weak var onlineImageView   : UIImageView!
  
  public func configure(controllers: Controllers?, worship: GDWorship?){
    self.worshipControllers = controllers as? WorshipControllers
    self.worship            = worship
    self.worshipControllers.present.streamCell(cell: self)
    self.worshipControllers.present.onLine(cell: self)
    self.worshipControllers.present.imageSteam(cell: self)
  }
  @objc public func playVideoGesture(){
    
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    self.worshipControllers.setup.cornerRadius(cell: self)
  }
  @IBAction func playVideo(_ button: UIButton){
    guard self.worship.streamInfo?.status == .OnLine else { return }
    let streamData = GDStreamData(worship: self.worship)
    self.worshipControllers.router.push(.streamVideo(streamData))
  }
}
