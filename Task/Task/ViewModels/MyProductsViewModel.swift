//
//  MyProductsViewModel.swift
//  Task
//
//  Created by Eslam Ali  on 18/04/2022.
//

import Foundation
import RxCocoa
import RxSwift

class MyProductsViewModel{
    
    var products = BehaviorSubject(value: [ProductItem]())

    func getProducts(){
        
        DataPersistanceManager.shared.fetchProductsFormDatabase { (result) in
            switch result {
            case .success(let productItems):
                self.products.on(.next(productItems))
            case .failure(let error):
                print(error.localizedDescription)
            
            }
        }
        
    }
    
    func deleteProduct(index : Int) {
        guard var products = try?  products.value() else {
            return
        }
        products.remove(at: index)
        self.products.on(.next(products))
    }

    
    
    
    
    
}
