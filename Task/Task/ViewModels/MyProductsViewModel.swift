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

    //MARK:- Fetch All Products Form Local Database
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
    
    //MARK:- Delete Product Form Loacl Database
    func deleteProduct(index : Int) {
        
        
        guard var temp = try?  products.value() else {
            return
        }
        DataPersistanceManager.shared.deleteProduct(model: temp[index]) { (result) in
            switch result {
            case .success():
                temp.remove(at: index)
                self.products.on(.next(temp))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
       
        
        
        
    }

    
    
    
    
    
}
