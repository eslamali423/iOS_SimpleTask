//
//  MyProductsViewController.swift
//  Task
//
//  Created by Eslam Ali  on 18/04/2022.
//

import UIKit
import RxSwift
import RxCocoa

class MyProductsViewController: UIViewController {

    
    //MARK:- Vars
    @IBOutlet weak var tableView: UITableView!
  
    var viewModel = MyProductsViewModel()
    
    var bag = DisposeBag()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        
        
        viewModel.getProducts()
        bindToTableview()
        // Do any additional setup after loading the view.
    }

    func bindToTableview(){
        viewModel.products.bind(to: tableView.rx.items(cellIdentifier: "cell" , cellType: ProductTableViewCell.self)) { row , item , cell in
            
            cell.configure(model: item)
            
            
        }.disposed(by: bag)
 
        self.tableView.rx.setDelegate(self)
                    .disposed(by: bag)
    
        // Delete Product
        tableView.rx.itemDeleted.subscribe(onNext: { [weak self] indexPath in
            guard let self = self else {return}
            self.viewModel.deleteProduct(index: indexPath.row)
        })
        
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MyProductsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
