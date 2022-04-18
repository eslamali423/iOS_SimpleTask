//
//  ProductCollectionViewCell.swift
//  Task
//
//  Created by Eslam Ali  on 18/04/2022.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let identefier = "ProductCollectionViewCell"
    
    //MARK:- Outlets
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
  
    
    //MARK:- Configure
    func configure(product : Product)  {
        productNameLabel.text = product.name
        productImageView.image = UIImage(named: product.image) // string for now
        productPriceLabel.text = "\(product.price)"
    }
}
