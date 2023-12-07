//
//  CarruselCollectionViewCell.swift
//  ExamenIngenio2
//
//  Created by Victor Hugo Barajas Santibañez on 05/12/23.
//

import UIKit

class CarruselCollectionViewCell: UICollectionViewCell {
  var spaceXInfo : String?
  
  var imageNave : UIImageView = {
    var image = UIImageView()
    return image
    
  }()
  
  
  
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    //self.backgroundView = UIImageView(image: UIImage(named: "fondo2"))
    self.backgroundColor = UIColor(displayP3Red:CGFloat.random(in: 0...1) , green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    
  
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func initUI(spaceXinfo : String){
    self.spaceXInfo = spaceXinfo
  }
  
}
