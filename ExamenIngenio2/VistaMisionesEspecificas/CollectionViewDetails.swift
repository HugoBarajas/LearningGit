//
//  CollectionViewDetails.swift
//  ExamenIngenio2
//
//  Created by Victor Hugo Barajas Santibañez on 05/12/23.
//

import Foundation
import UIKit

/*protocol CollectionViewDetailsDelegate{
  func selectedNave(indexPath : IndexPath)
}*/

class CollectionViewDetails : UIView{
  
  var fondo : UIImageView = {
      var fondo = UIImageView()
      fondo.image = UIImage(named: "fondo2")
    fondo.contentMode = .scaleAspectFill
      return fondo
    }()
  
  //var delegate : CollectionViewDetailsDelegate?
  
  var dataSource = [String]()
    
  var collectionViewCarrusel :UICollectionView = {
    var layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    
    var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.backgroundColor = .clear
    return collection
    
  }()
  
  init(dataSource : [String]){
    self.dataSource = dataSource
    super.init(frame: .zero)
    self.backgroundColor = .clear
    //self.addSubview(fondo)
    //fondo.addAnchorsWithMargin(0)
    initUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initUI(){
    collectionViewCarrusel.isPagingEnabled = true
    collectionViewCarrusel.delegate = self
    collectionViewCarrusel.dataSource = self
    collectionViewCarrusel.register(CarruselCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    
    
    self.addSubview(collectionViewCarrusel)
    collectionViewCarrusel.addAnchorsWithMargin(0)
    
  }
    
  }
  
extension CollectionViewDetails: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CarruselCollectionViewCell
    
    let info = dataSource[indexPath.item]
  
    cell.initUI(spaceXinfo : info)
    
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: width - 20  , height: height / 6)
  }
  
 
  
}
  
