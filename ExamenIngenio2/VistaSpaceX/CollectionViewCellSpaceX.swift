//
//  CollectionViewCellSpaceX.swift
//  ExamenIngenio2
//
//  Created by Victor Hugo Barajas Santibañez on 29/11/23.
//

import Foundation
import UIKit
import SDWebImage

class CollectionViewCellSpaceX : UICollectionViewCell{
  
  var spaceXInfo : ModelSpaceX?

  
  var missionImage : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "mision1")
    image.clipsToBounds = true
    image.backgroundColor = .white
    image.contentMode = .scaleAspectFit
    image.layer.cornerRadius = 57
    return image
    
  }()
  
  
  var viewDegradado : UIView = {
    var viewDegradado1 = UIView()
    
    viewDegradado1.layer.cornerRadius = 60
    viewDegradado1.backgroundColor = .white
    viewDegradado1.clipsToBounds = true
    viewDegradado1.contentMode = .scaleAspectFill
    let screenSize: CGRect = UIScreen.main.bounds
        
    return viewDegradado1
    
  }()
  
  var labelMision : UILabel = {
    var labelMision1 = UILabel()
    labelMision1.backgroundColor = .clear
    labelMision1.clipsToBounds = true
    //labelMision1.textAlignment = .center
    //labelMision1.adjustsFontSizeToFitWidth = true
    labelMision1.textColor = .white
    labelMision1.font = UIFont(name: "Arial Bold", size: 15)
    return labelMision1
  }()
  
  var labelLanzamiento : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.clipsToBounds = true
    label.textAlignment = .center
    //label.adjustsFontSizeToFitWidth = true
    label.textColor = .white
    label.font = .systemFont(ofSize: 15)
    return label
  }()
  
  var labelFecha : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.clipsToBounds = true
   // label.textAlignment = .center
    //label.adjustsFontSizeToFitWidth = true
    label.textColor = .white
    label.font = .systemFont(ofSize: 15)
    return label
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    self.backgroundView = UIImageView(image: UIImage(named: "fondo2"))
    
  
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initUI(spaceXinfo : ModelSpaceX){
    self.spaceXInfo = spaceXinfo
    
    
    let newLayer = CAGradientLayer()
    newLayer.colors = [UIColor.red.cgColor, UIColor.systemYellow.cgColor]
    newLayer.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
    viewDegradado.layer.addSublayer(newLayer)
    
    self.addSubview(viewDegradado)
    viewDegradado.addAnchorsAndCenter(centerX: false, centerY: true, width: 120, height: 120, left: 10, top: nil, right: nil, bottom: nil)
    
    missionImage.sd_setImage(with: URL(string: (spaceXinfo.links?.mission_patch)!), placeholderImage: UIImage(named: "mision1"))
    
    
    viewDegradado.addSubview(missionImage)
    missionImage.addAnchorsAndCenter(centerX: true, centerY: true, width: 114, height: 114, left: nil, top: nil, right: nil, bottom: nil)
    
 
    
    labelMision.text = spaceXinfo.mission_name
    self.addSubview(labelMision)
    labelMision.addAnchorsAndCenter(centerX: false, centerY: false, width: 110, height: 15, left: 10, top: 20, right: nil, bottom: nil, withAnchor: .left, relativeToView: viewDegradado)
    
    labelLanzamiento.text = spaceXinfo.launch_site?.site_name
    self.addSubview(labelLanzamiento)
    labelLanzamiento.addAnchorsAndCenter(centerX: false, centerY: false, width: 100, height: 15, left: 10, top: 65, right: nil, bottom: nil, withAnchor: .left, relativeToView: viewDegradado)
    
    var fechaNueva = formatearFecha(fechaString: (spaceXInfo?.launch_date_utc)!)
    
    labelFecha.text = fechaNueva
    self.addSubview(labelFecha)
    labelFecha.addAnchorsAndCenter(centerX: false, centerY: false, width: 200, height: 15, left: 10, top: nil, right: nil, bottom: 20, withAnchor: .left, relativeToView: viewDegradado)
  }
  
  func formatearFecha(fechaString : String) -> String {

    // Crear un DateFormatter y configurar el formato y el locale
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    dateFormatter.locale = Locale(identifier: "es_ES")
    // Convertir la cadena de fecha a un objeto Date
    if let fecha = dateFormatter.date(from: fechaString) {
      // Configurar un nuevo formato para obtener la representación en la cadena deseada
      let nuevoDateFormatter = DateFormatter()
      nuevoDateFormatter.dateFormat = "EEEE, MMM d, yyyy"
      nuevoDateFormatter.locale = Locale(identifier: "es_ES")
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
  

