//
//  CategoryViewModel.swift
//  Task
//
//  Created by Eslam Ali  on 18/04/2022.
//

import Foundation

class CategoryViewModel {
    
    
    var categoies : [Category] = []
    
    func getCategoies (completion: @escaping (Bool)->Void) {
       
        categoies = [.init(name: "Breakfast"),
                     .init(name: "Dinner"),
                     .init(name: "Dessert"),
                     .init(name: "Popular Dishes"),
                     .init(name: "Chef's Specials"),]
     completion(true)
    }
    
    
    
    
}
