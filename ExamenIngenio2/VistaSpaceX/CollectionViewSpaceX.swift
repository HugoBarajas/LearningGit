//
//  CollectionViewSpaceX.swift
//  ExamenIngenio2
//
//  Created by Victor Hugo Barajas Santibañez on 29/11/23.
//

import Foundation
import UIKit

protocol CollectionViewSpaceXDelegate{
  func selectedMision(indexPath : IndexPath)
}

class CollectionViewSpaceX : UIView{
  
  var fondo : UIImageView = {
      var fondo = UIImageView()
      fondo.image = UIImage(named: "fondo2")
    fondo.contentMode = .scaleAspectFill
      return fondo
    }()
  
  var delegate : CollectionViewSpaceXDelegate?
  
  var dataSource = [ModelSpaceX]()
    
  var bandera = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false ]
  
  
  
  var collectionViewPreView :UICollectionView = {
    var layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 5
    layout.minimumInteritemSpacing = 0
    
    var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.backgroundColor = .clear
    return collection
    
  }()
  
  init(){
    super.init(frame: .zero)
    self.backgroundColor = .yellow
    self.addSubview(fondo)
    fondo.addAnchorsWithMargin(0)
    initUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initUI(){
    collectionViewPreView.delegate = self
    collectionViewPreView.dataSource = self
    collectionViewPreView.register(CollectionViewCellSpaceX.self, forCellWithReuseIdentifier: "cell")
    
    
    self.addSubview(collectionViewPreView)
    collectionViewPreView.addAnchorsWithMargin(0)
    
  }
  

  func receiveData(dataSource: [ModelSpaceX]){
      self.dataSource = dataSource
    collectionViewPreView.reloadData()
    
  }
  
  }
  
extension CollectionViewSpaceX: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCellSpaceX
    
    let info = dataSource[indexPath.item]
  
    cell.initUI(spaceXinfo : info)
    
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: width - 20  , height: height / 6)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("vamos a la descripcion de la mision")
    delegate?.selectedMision(indexPath: indexPath)
 

    
  }
  
}
  
  

