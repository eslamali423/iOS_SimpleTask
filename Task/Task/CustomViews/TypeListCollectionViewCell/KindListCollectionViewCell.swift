//
//  ListCollectionViewCell.swift
//  Task
//
//  Created by Eslam Ali  on 18/04/2022.
//

import UIKit

class KindListCollectionViewCell: UICollectionViewCell {
    
    static let identefier = "KindListCollectionViewCell"
    
    
    @IBOutlet weak var kindNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    //MARK:- Configure
    func configure  (kind: Kind) {
        kindNameLabel.text = kind.name 
    }

}
