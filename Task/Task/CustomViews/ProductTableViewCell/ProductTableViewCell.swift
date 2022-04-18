//
//  ProductTableViewCell.swift
//  Task
//
//  Created by Eslam Ali  on 18/04/2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        productImageView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(model : ProductItem)  {
        productNameLabel.text  = model.name
        productPriceLabel.text = model.price
        productImageView.image = UIImage(named: model.image ?? "placeholder")
    }
    
}
