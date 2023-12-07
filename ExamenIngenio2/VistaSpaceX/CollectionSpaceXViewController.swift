//
//  CollectionSpaceXViewController.swift
//  ExamenIngenio2
//
//  Created by Victor Hugo Barajas Santibañez on 29/11/23.
//

import UIKit

class CollectionSpaceXViewController: UIViewController {

  var dataSource = [ModelSpaceX]()
  
  //creo Variables para el Collection.
  
  var fondo : UIImageView = {
      var fondo = UIImageView()
      fondo.image = UIImage(named: "fondo2")
    fondo.contentMode = .scaleAspectFill
      return fondo
    }()
  
  var labelTitulo : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.clipsToBounds = true
    label.textAlignment = .center
    label.text = "Launches Past"
    label.layer.borderWidth = 2
    label.layer.borderColor = UIColor.black.cgColor
    label.adjustsFontSizeToFitWidth = true
    label.textColor = .white
    label.font = .systemFont(ofSize: 30)
    return label
  }()
  
  var collectionViewSpace : CollectionViewSpaceX = {
    var collectionViewSpace1 = CollectionViewSpaceX()
    return collectionViewSpace1
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.addSubview(fondo)
      fondo.addAnchorsWithMargin(0)
      initUI()
          getData()
    
  
    }
    
  func getData(){
    let networkManager = NetworkManager()
    networkManager.delegate = self
    networkManager.getSpaceXList()
  }
  
  func initUI(){
    view.addSubview(labelTitulo)
    labelTitulo.addAnchorsAndSize(width: 130, height: 50, left: 10, top: 60, right: nil, bottom: nil)
    
    
    collectionViewSpace.delegate = self
    view.addSubview(collectionViewSpace)
    collectionViewSpace.addAnchorsAndSize(width: nil, height: nil, left: 5, top: 10, right: 5, bottom: nil, withAnchor: .top, relativeToView: labelTitulo)
    
  }
  
  

    
}

extension CollectionSpaceXViewController : NetworkManagerDelegate{
  func responseSuccess(response: [ModelSpaceX]) {
    print("responseSucess\(response)")
    dataSource.append(contentsOf: response)
    collectionViewSpace.receiveData(dataSource: dataSource)
  }
  
  func responseError(error: Error) {
    print("responseError: \(error)")
  }
  
}

extension CollectionSpaceXViewController : CollectionViewSpaceXDelegate{
  func selectedMision(indexPath: IndexPath) {
    
    let info = dataSource[indexPath.item]
    
    
    
    let misionEspecifica = EspecificMissionsViewController()
    
    misionEspecifica.spaceXInfo = info
    misionEspecifica.modalPresentationStyle = .fullScreen
    self.present(misionEspecifica, animated: true)
  }
  
 
  
}
