//
//  ImageCollectionViewCell.swift
//  HorizontalCollectionView
//
//  Created by Nivesh on 22/05/20.
//  Copyright © 2020 Nivesh. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  func setImageOnCell(_ imageName: String) {
     imageView.image = UIImage(named: imageName)
  }

}
