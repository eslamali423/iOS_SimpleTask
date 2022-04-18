//
//  AddProductViewModel.swift
//  Task
//
//  Created by Eslam Ali  on 18/04/2022.
//

import Foundation


class AddProductViewModel {
    
    
    func addProduct(product: Product){
        
        DataPersistanceManager.shared.addProductToDatabase(model: product) { (result) in
            switch result {
            case .success():
                print("product Added To Locall Database")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    
}
