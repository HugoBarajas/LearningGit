//
//  YouTubeViewController.swift
//  ExamenIngenio2
//
//  Created by Angel Olvera on 07/12/23.
//

import UIKit
import YouTubePlayer

class YouTubeViewController: UIViewController {
  
  var spaceXInfo : ModelSpaceX?
  var viewModel : YouTubeViewModel!
  
  var misionViewVideo: UIView = {
    var view = UIView()
    view.backgroundColor = .black
    view.layer.borderWidth = 4
    view.layer.borderColor = UIColor.white.cgColor
    view.clipsToBounds = true
    return view
  }()
  
  var missionVideo : YouTubePlayerView = {
    var video = YouTubePlayerView()
    return video
    

  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initInfo()
    initUI()
  }
  func initInfo(){
    spaceXInfo = viewModel.detalleInfo
  }

  
  func initUI(){
    
    view.addSubview(misionViewVideo)
    misionViewVideo.addAnchorsAndCenter(centerX: true, centerY: true, width: width, height: 400, left: nil, top: nil, right: nil, bottom: nil)
    missionVideo.loadVideoID((spaceXInfo?.links?.youtube_id)!)
    missionVideo.frame = CGRect(x: 0, y: 0, width: width, height: 400)
    misionViewVideo.addSubview(missionVideo)
  }
  
}
