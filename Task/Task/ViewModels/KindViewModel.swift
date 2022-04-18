//
//  KindViewModel.swift
//  Task
//
//  Created by Eslam Ali  on 18/04/2022.
//

import Foundation


class KindViewModel {
    
    var kinds : [Kind] = []
    
    func getKinds(completion: @escaping (Bool)->Void)  {
        
        kinds = [.init(name: "All"),
                 .init(name: "Plates"),
                 .init(name: "Hot Drinks"),
                 .init(name: "Ice Drinks"),
                 
                 ]
    completion(true)
    }
    
    
    
}
