//
//  CategoryCollectionViewCell.swift
//  Task
//
//  Created by Eslam Ali  on 18/04/2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identefier = "CategoryCollectionViewCell"
    
    @IBOutlet weak var categoryNameLabel: UILabel!
  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configure(category: Category){
        categoryNameLabel.text = category.name
    }

}
