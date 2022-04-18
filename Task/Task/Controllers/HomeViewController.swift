//
//  HomeViewController.swift
//  Task
//
//  Created by Eslam Ali  on 18/04/2022.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK:- Outlets
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var kindsCollectionView: UICollectionView!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    //MARK:- Vars
    
    var categoryViewModel = CategoryViewModel()
    var kindsViewModel = KindViewModel()
    var productViewModel = ProductViewModel()
    
    //MARK:- Life Cyccle
    override func viewDidLoad() {
        super.viewDidLoad()
   
        registerCells()
        
        getCategoryData()
        getKindsData()
        getProductsData()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        kindsCollectionView.delegate = self
        kindsCollectionView.dataSource = self
        
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        
    }
 
    //MARK:- Configure Add Product Button
    @IBAction func AddButton(_ sender: Any) {
        
       let addProductVC = AddProductViewController()
        navigationController?.pushViewController(addProductVC, animated: true)
    }
    
    //MARK:- Register Cells to CollectionViews
    func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identefier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identefier)
        kindsCollectionView.register(UINib(nibName: KindListCollectionViewCell.identefier, bundle: nil), forCellWithReuseIdentifier: KindListCollectionViewCell.identefier)
        productsCollectionView.register(UINib(nibName: ProductCollectionViewCell.identefier, bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.identefier)
        
    }
    
    
    //MARK:- Get Data
    func getCategoryData()  {
        categoryViewModel.getCategoies { (isSuccess) in
            if isSuccess {
                self.categoryCollectionView.reloadData()
            }
        }
    }
    
    func getKindsData()  {
        kindsViewModel.getKinds { (isSuccess) in
            if isSuccess {
                self.kindsCollectionView.reloadData()
            }
        }
    }
    
    func getProductsData()  {
        productViewModel.getProducts { (isSuccess) in
            if isSuccess {
                self.kindsCollectionView.reloadData()
            }
        }
    }
    

}

//MARK:- Extension for collectionView

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categoryViewModel.categoies.count
        case kindsCollectionView:
            return kindsViewModel.kinds.count
        case productsCollectionView:
            return productViewModel.products.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        switch collectionView {
        case categoryCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identefier, for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(category: categoryViewModel.categoies[indexPath.row])
            
            return cell
        case kindsCollectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KindListCollectionViewCell.identefier, for: indexPath) as? KindListCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(kind: kindsViewModel.kinds[indexPath.row])
            
            return cell
        case productsCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identefier, for: indexPath) as? ProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(product: productViewModel.products[indexPath.row])
            
            return cell
        default:
            return UICollectionViewCell()
        }

       
    }
    
    
    
    
    
}
