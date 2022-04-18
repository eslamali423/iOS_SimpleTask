//
//  DataPersistanceManager.swift
//  Task
//
//  Created by Eslam Ali  on 18/04/2022.
//

import Foundation
import CoreData
import UIKit

class DataPersistanceManager {
    
    static let shared  = DataPersistanceManager()
    
    enum DatabaseError : Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }
    
    //MARK:- Dowload Movie To Database
    func addProductToDatabase(model: Product, completion: @escaping (Result<Void,Error>)->Void)  {
        // refrence to app delegate
     
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let context =  appDelegate.persistentContainer.viewContext
        
        let item = ProductItem(context: context)
       
        
        item.name = model.name
        item.category = model.category
        item.info = model.info
        item.price = model.price
        item.type = model.type
        item.image = model.image
       
        do {
       try  context.save()
            completion(.success(()))
        }catch {
            completion(.failure(DatabaseError.failedToSaveData))
        }
   
    }
    
}
