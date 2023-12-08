//
//  EspecificMissionsViewController.swift
//  ExamenIngenio2
//
//  Created by Victor Hugo Barajas Santibañez on 30/11/23.
//

import UIKit
import YouTubePlayer

class EspecificMissionsViewController: UIViewController {
  
  var spaceXInfo : ModelSpaceX?
 /*
  mission_name
  flight_number
  launch_year
  rocket.rocket_name
  rocket.rocket_type
  launch_site.site_name
  launch_site.launch_success
  */
  var missionVideo : YouTubePlayerView = {
    var video = YouTubePlayerView()
    return video
    
    
    
  }()
  
  var collectionViewCarruselNuevo : CollectionViewDetails?
   
  
  var fondo : UIImageView = {
      var fondo = UIImageView()
      fondo.image = UIImage(named: "fondo2")
    fondo.contentMode = .scaleAspectFill
      return fondo
    }()
  
  var botonRegresar : UIButton = {
      var regreso = UIButton()
    regreso.setImage(UIImage(named: "regresar"), for: .normal)
    regreso.tintColor = .white
      return regreso
  }()
  
  var misionViewVideo: UIView = {
    var view = UIView()
    view.backgroundColor = .brown
    view.layer.borderWidth = 4
    view.layer.borderColor = UIColor.white.cgColor
    view.clipsToBounds = true
      return view
  }()
  
  var missionLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.textAlignment = .center
    label.layer.borderWidth = 2
    label.layer.borderColor = UIColor.white.cgColor
    label.font = UIFont(name: "Arial Bold", size: 20)
    return label
    
  }()
  
  var detailsLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.layer.borderWidth = 2
    label.numberOfLines = 0
    //label.adjustsFontSizeToFitWidth = true
    label.layer.borderColor = UIColor.white.cgColor
    label.adjustsFontSizeToFitWidth = true
    label.textAlignment = .center
    label.font = UIFont(name: "Arial Bold", size: 19)
    return label
    
  }()
  
  var missionYearLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.textAlignment = .center
    label.layer.borderWidth = 2
    label.layer.borderColor = UIColor.white.cgColor
    label.font = UIFont(name: "Arial Bold", size: 14)
    return label
    
  }()
  
  //AkayaKanadaka
  
  var rocketNameLabel: UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.textAlignment = . center
    label.layer.borderWidth = 2
    label.layer.borderColor = UIColor.white.cgColor
    label.font = UIFont(name: "Arial Bold", size: 16)
    return label
  }()
  
  var rocketTypeLabel: UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.textAlignment = . center
    label.layer.borderWidth = 2
    label.layer.borderColor = UIColor.white.cgColor
    label.font = UIFont(name: "Arial Bold", size: 17)
    return label
  }()
  
  var launchSiteNameLabel: UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.textAlignment = . center
    label.layer.borderWidth = 2
    label.adjustsFontSizeToFitWidth = true
    label.layer.borderColor = UIColor.white.cgColor
    label.font = UIFont(name: "Arial Bold", size: 15)
    return label
  }()
  
  var rocketIDLabel: UILabel = {
    var label = UILabel()
    
    label.textColor = .white
    label.textAlignment = . center
    label.layer.borderWidth = 2
    label.layer.borderColor = UIColor.white.cgColor
    label.font = UIFont(name: "Arial Bold", size: 13)
    return label
  }()
  
  var dateLabel: UILabel = {
    var label = UILabel()
    
    label.textColor = .white
    label.textAlignment = . center
    label.layer.borderWidth = 2
    label.layer.borderColor = UIColor.white.cgColor
    label.font = UIFont(name: "Arial Bold", size: 13)
    return label
  }()
    
    var playButton : UIButton = {
        var play = UIButton()
        play.backgroundColor = .systemPink
        play.setImage(UIImage(named: "tocar"), for: .normal)
        play.contentMode = .scaleToFill
        play.layer.cornerRadius = 25
        play.clipsToBounds = true
        play.tintColor = .white
        return play
    }()
    
    var playButtonLarge : UIButton = {
        var playLarge = UIButton()
        playLarge.backgroundColor = .systemPink
        playLarge.setTitle("YT Video", for: .normal)
        playLarge.layer.cornerRadius = 10
        playLarge.clipsToBounds = true
        return playLarge
    }()
    
    var launchInfoButton : UIButton = {
        var launchInfo = UIButton()
        launchInfo.backgroundColor = .blue
        launchInfo.setImage(UIImage(named: "informacion"), for: .normal)
        launchInfo.layer.cornerRadius = 25
        launchInfo.clipsToBounds = true
        launchInfo.tintColor = .white
        return launchInfo
    }()
    
    var launchInfoButtonLarge : UIButton = {
        var launchInfoButton = UIButton()
        launchInfoButton.backgroundColor = .blue
        launchInfoButton.setTitle("Launch Info", for: .normal)
        launchInfoButton.layer.cornerRadius = 10
        launchInfoButton.clipsToBounds = true
        return launchInfoButton
    }()
    
    
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      view.addSubview(fondo)
      fondo.addAnchorsWithMargin(0)
     // setUpTimer()
      initUI()
    }
   
  
  func initUI(){
    
    botonRegresar.addTarget(self, action: #selector(goToInicio), for: .touchUpInside)
    view.addSubview(botonRegresar)
    botonRegresar.addAnchorsAndSize(width: 20, height: 20, left: 20, top: 50, right: nil, bottom: nil)
    
    
   /* view.addSubview(misionViewVideo)
    misionViewVideo.addAnchorsAndCenter(centerX: true, centerY: false, width: 250, height: 200, left: nil, top: 70, right: nil, bottom: nil)
    
    
    missionVideo.loadVideoID((spaceXInfo?.links?.youtube_id)!)
    missionVideo.frame = CGRect(x: 0, y: 0, width: 250, height: 200)
    misionViewVideo.addSubview(missionVideo)
    */
    collectionViewCarruselNuevo = CollectionViewDetails(dataSource: (spaceXInfo?.links?.flickr_images)!)
    view.addSubview(collectionViewCarruselNuevo!)
    collectionViewCarruselNuevo!.addAnchorsAndSize(width: width - 20, height: 200, left: nil, top: 70, right: nil, bottom: nil)
   
    missionLabel.text = spaceXInfo?.mission_name
    view.addSubview(missionLabel)
    missionLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 50, top: 5, right: 50, bottom: nil, withAnchor: .top, relativeToView: collectionViewCarruselNuevo)
    
    
    detailsLabel.text = spaceXInfo?.details
    view.addSubview(detailsLabel)
    detailsLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 80, left: 60, top: 5, right: 60, bottom: nil, withAnchor: .top, relativeToView: missionLabel)
    
    launchSiteNameLabel.text = spaceXInfo?.launch_site?.site_name_long
    view.addSubview(launchSiteNameLabel)
    launchSiteNameLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 70, top: 5, right: 70, bottom: nil, withAnchor: .top, relativeToView: detailsLabel )
    
    dateLabel.text = spaceXInfo?.launch_date_local
    view.addSubview(dateLabel)
    dateLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 80, top: 5, right: 80, bottom: nil, withAnchor: .top, relativeToView: launchSiteNameLabel)
    

    
    rocketTypeLabel.text = spaceXInfo?.rocket?.rocket_type
    view.addSubview(rocketTypeLabel)
    rocketTypeLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 90, top: 5, right: 90, bottom: nil, withAnchor: .top, relativeToView: dateLabel)
    
    rocketNameLabel.text = spaceXInfo?.rocket?.rocket_name
    view.addSubview(rocketNameLabel)
    rocketNameLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 100, top: 5, right: 100, bottom: nil, withAnchor: .top, relativeToView: rocketTypeLabel)
    
    
    
    rocketIDLabel.text = spaceXInfo?.rocket?.rocket_id
    view.addSubview(rocketIDLabel)
    rocketIDLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 110, top: 5, right: 110, bottom: nil, withAnchor: .top, relativeToView: rocketNameLabel)
    
    
    
    missionYearLabel.text = spaceXInfo?.launch_year
    view.addSubview(missionYearLabel)
    missionYearLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 120, top: 5, right: 120, bottom: nil, withAnchor: .top, relativeToView: rocketIDLabel)
    
      view.addSubview(playButton)
      playButton.addAnchorsAndSize(width: 50, height: 25, left: 50, top: 20, right: nil, bottom: nil, withAnchor: .top, relativeToView: missionYearLabel)
      
      view.addSubview(playButtonLarge)
      playButtonLarge.addAnchorsAndSize(width: 200, height: 25, left: 130, top: 20, right: nil, bottom: nil, withAnchor: .top, relativeToView: missionYearLabel)
      
      view.addSubview(launchInfoButton)
      launchInfoButton.addAnchorsAndSize(width: 50, height: 25, left: 50, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: playButton)
      
      view.addSubview(launchInfoButtonLarge)
      launchInfoButtonLarge.addAnchorsAndSize(width: 200, height: 25, left: 130, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: playButtonLarge)
    
    
  }
  
  @objc func goToInicio(){
    dismiss(animated: true, completion: nil)
    //let viewController = ViewControllerIG()
    //navigationController?.pushViewController(viewController, animated: true)
  }


}
/*
extension CollectionSpaceXViewController : CollectionViewDetailsDelegate{
  func selectedNave(indexPath: IndexPath) {
    
    let info = dataSource[indexPath.item]
    
    
    
    let misionEspecifica = EspecificMissionsViewController()
    
    misionEspecifica.spaceXInfo = info
    misionEspecifica.modalPresentationStyle = .fullScreen
    self.present(misionEspecifica, animated: true)
  }
  
}
 */
