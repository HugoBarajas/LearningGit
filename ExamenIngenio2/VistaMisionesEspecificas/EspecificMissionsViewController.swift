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
    regreso.backgroundColor = .clear
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
  
  var detailsLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    //label.textAlignment = .center
    label.text = "Details"
    label.layer.borderWidth = 2
    label.layer.borderColor = UIColor.white.cgColor
    label.font = UIFont(name: "Arial Bold", size: 30)
    return label
    
  }()
  
  var dateLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.layer.borderWidth = 2
    label.numberOfLines = 0
    //label.adjustsFontSizeToFitWidth = true
    label.layer.borderColor = UIColor.white.cgColor
    label.adjustsFontSizeToFitWidth = true
    label.font = UIFont(name: "Arial Bold", size: 15)
    return label
    
  }()
  
  var siteLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.layer.borderWidth = 2
    label.layer.borderColor = UIColor.white.cgColor
    label.font = UIFont(name: "Arial Bold", size: 15)
    return label
    
  }()
  
  //AkayaKanadaka
  
  var rocketNameLabel: UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.layer.borderWidth = 2
    label.layer.borderColor = UIColor.white.cgColor
    label.font = UIFont(name: "Arial Bold", size: 15)
    return label
  }()
  
  var rocketTypeLabel: UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.layer.borderWidth = 2
    label.layer.borderColor = UIColor.white.cgColor
    label.font = UIFont(name: "Arial Bold", size: 15)
    return label
  }()
  
  
  var detallesLabel: UILabel = {
    var label = UILabel()
    label.textColor = .white
    label.layer.borderWidth = 2
    label.numberOfLines = 0
    label.layer.borderColor = UIColor.white.cgColor
    label.font = UIFont(name: "Arial Bold", size: 15)
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
      //view.backgroundColor = .red
      view.addSubview(fondo)
      fondo.addAnchorsWithMargin(0)
     // setUpTimer()
      initUI()
    }
   
  
  func initUI(){
    
    botonRegresar.addTarget(self, action: #selector(goToInicio), for: .touchUpInside)
    view.addSubview(botonRegresar)
    botonRegresar.addAnchorsAndSize(width: 30, height: 30, left: 20, top: 70, right: nil, bottom: nil)
    
    
   /* view.addSubview(misionViewVideo)
    misionViewVideo.addAnchorsAndCenter(centerX: true, centerY: false, width: 250, height: 200, left: nil, top: 70, right: nil, bottom: nil)
    
    
    missionVideo.loadVideoID((spaceXInfo?.links?.youtube_id)!)
    missionVideo.frame = CGRect(x: 0, y: 0, width: 250, height: 200)
    misionViewVideo.addSubview(missionVideo)
    */
    
   
    //missionLabel.text = spaceXInfo?.mission_name
    view.addSubview(detailsLabel)
    detailsLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 20, height: 40, left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: botonRegresar)
    
    var fecha = formatearFecha(fechaString: (spaceXInfo?.launch_date_utc)!)
    
    dateLabel.text = ("Date: \(fecha)")
    view.addSubview(dateLabel)
    dateLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 20, height: 40, left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: detailsLabel)
    
    var sitio = spaceXInfo?.launch_site?.site_name_long
    siteLabel.text = ("Site: \(sitio!)")
    view.addSubview(siteLabel)
    siteLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 20, height: 40, left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: dateLabel )
    
    rocketNameLabel.text = ("Rocket: \((spaceXInfo?.rocket?.rocket_name)!)")
    view.addSubview(rocketNameLabel)
    rocketNameLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 20, height: 40, left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: siteLabel)
    

    
    rocketTypeLabel.text = ("Rocket: \((spaceXInfo?.rocket?.rocket_type)!)")
    view.addSubview(rocketTypeLabel)
    rocketTypeLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 20, height: 40, left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: rocketNameLabel)
    
    collectionViewCarruselNuevo = CollectionViewDetails(dataSource: (spaceXInfo?.links?.flickr_images)!)
    view.addSubview(collectionViewCarruselNuevo!)
    collectionViewCarruselNuevo!.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 20, height: 200, left: nil, top: 20, right: nil, bottom: nil, withAnchor: .top, relativeToView: rocketTypeLabel)
    
    
  
    detallesLabel.text = spaceXInfo?.details
    view.addSubview(detallesLabel)
    detallesLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 20, height: 100, left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: collectionViewCarruselNuevo)
    
      view.addSubview(playButton)
      playButton.addAnchorsAndSize(width: 50, height: 25, left: 50, top: 20, right: nil, bottom: nil, withAnchor: .top, relativeToView: detallesLabel)
      
      view.addSubview(playButtonLarge)
      playButtonLarge.addAnchorsAndSize(width: 200, height: 25, left: 130, top: 20, right: nil, bottom: nil, withAnchor: .top, relativeToView: detallesLabel)
      
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
  
  func formatearFecha(fechaString : String) -> String {

    // Crear un DateFormatter y configurar el formato y el locale
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    //dateFormatter.locale = Locale(identifier: "es_ES")
    // Convertir la cadena de fecha a un objeto Date
    if let fecha = dateFormatter.date(from: fechaString) {
      // Configurar un nuevo formato para obtener la representación en la cadena deseada
      let nuevoDateFormatter = DateFormatter()
      nuevoDateFormatter.dateFormat = "EEEE, MMM d, yyyy"
      //nuevoDateFormatter.locale = Locale(identifier: "es_ES")
      // Obtener la cadena de fecha formateada
      let fechaFormateada = nuevoDateFormatter.string(from: fecha)
      print("Fecha formateada: \(fechaFormateada)")
      return fechaFormateada
    } else {
      print("Error al convertir la cadena de fecha a Date.")
    }
    return ""
    
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
