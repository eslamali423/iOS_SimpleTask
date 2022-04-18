//
//  ProductViewModel.swift
//  Task
//
//  Created by Eslam Ali  on 18/04/2022.
//

import Foundation

class ProductViewModel {
    
    var products : [Product] = []
    
    
    func getProducts(completion: @escaping (Bool)->Void){
        
        products = [
            .init(image: "placeholder", name: "Ice Coffe", price: "175", info: "", category: "", type: ""),
            .init(image: "placeholder", name: "Green tea", price: "175", info: "", category: "", type: ""),
            .init(image: "placeholder", name: "Pina Colada", price: "175", info: "", category: "", type: ""),
            .init(image: "placeholder", name: "Orange", price: "175", info: "", category: "", type: ""),
            .init(image: "placeholder", name: "latte", price: "175", info: "", category: "", type: ""),
            .init(image: "placeholder", name: "Hot chocolate", price: "175", info: "", category: "", type: ""),
            
            
            
                    
        
        
        ]
        
    }
    
}
