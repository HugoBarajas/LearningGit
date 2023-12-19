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
    image.clipsToBounds = true
    image.layer.cornerRadius = 25
    image.image = UIImage(named: "mision1")
    return image
    
  }()

  override init(frame: CGRect) {
    super.init(frame: .zero)
    self.backgroundColor = .clear
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  func initUI(spaceXinfo : String){
    self.spaceXInfo = spaceXinfo
    imageNave.sd_setImage(with:URL(string: spaceXinfo), placeholderImage: UIImage(named: "mision1") )
   
    self.addSubview(imageNave)
    imageNave.addAnchorsAndSize(width: nil, height: nil, left: 0, top: 0, right: 0, bottom: 30)
  }
  
}
