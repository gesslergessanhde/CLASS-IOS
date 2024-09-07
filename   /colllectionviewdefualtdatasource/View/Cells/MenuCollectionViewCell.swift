//
//  MenuCollectionViewCell.swift
//  colllectionviewdefualtdatasource
//
//  Created by LABORATORIO MAC UAM on 31/8/24.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
    // Initialization code
    }
    func setup(menuModel: MenuModel){
        
        imageView.image =  UIImage(named: menuModel.image)
        priceLabel.text = "USD \(menuModel.price)"
        descriptionLabel.text = menuModel.description
        nameLabel.text = menuModel.name
    }
}
