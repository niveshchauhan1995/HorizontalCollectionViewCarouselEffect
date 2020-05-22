//
//  ViewController.swift
//  HorizontalCollectionView
//
//  Created by Nivesh on 22/05/20.
//  Copyright © 2020 Nivesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
      
  @IBOutlet weak var collectionView: UICollectionView! {
    didSet {
      collectionView.dataSource = self
      collectionView.delegate = self
    }
  }
  
  var imageArr:[String] = ["dummyImage1","dummyImage2","dummyImage3","dummyImage4"]
  
  let customNibName = "ImageCollectionViewCell"
  
  let collectionMargin = CGFloat(8)
  let itemSpacing = CGFloat(0)
  let itemHeight = CGFloat(350)
  var itemWidth = CGFloat(0)
  var currentItem = 0
  

  override func viewDidLoad() {
    super.viewDidLoad()
    registerCells()
    setupLayout()
  }
  
  fileprivate func setupLayout() {
      let layout = self.collectionView.collectionViewLayout as! CarouselFlowLayout
      let cardWidth = UIScreen.main.bounds.width
      layout.itemSize = CGSize(width: cardWidth - 100, height: 300)
      layout.spacingMode = CarouselFlowLayoutSpacingMode.overlap(visibleOffset: 30)
  }
  
  func registerCells() {
      self.collectionView.register(UINib(nibName: customNibName, bundle: nil), forCellWithReuseIdentifier: customNibName)
  }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageArr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let item = self.imageArr[indexPath.row]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
    cell.setImageOnCell(item)
    return cell
  }
  
}
