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

    var misionViewVideo: UIView = {
      var view = UIView()
      view.backgroundColor = .brown
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
        initUI()
    }
    
    func initUI(){
        
        view.addSubview(misionViewVideo)
         misionViewVideo.addAnchorsAndCenter(centerX: true, centerY: false, width: 250, height: 200, left: nil, top: 70, right: nil, bottom: nil)

        missionVideo.loadVideoID((spaceXInfo?.links?.youtube_id)!)
        missionVideo.frame = CGRect(x: 0, y: 0, width: 250, height: 200)
        missionVideo.addSubview(missionVideo)
    }

}
