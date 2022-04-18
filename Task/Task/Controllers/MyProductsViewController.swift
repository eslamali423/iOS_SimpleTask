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

    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        
       
        viewModel.getProducts()
        bindToTableview()
        // Do any additional setup after loading the view.
    }

    
    //MARK:- Bind To TableView
    func bindToTableview(){
       //Bind
        viewModel.products.bind(to: tableView.rx.items(cellIdentifier: "cell" , cellType: ProductTableViewCell.self)) { row , item , cell in
            
            cell.configure(model: item)
            
            
        }.disposed(by: bag)
        
        //set delegate
        self.tableView.rx.setDelegate(self)
                    .disposed(by: bag)
    
        // Delete Product
        tableView.rx.itemDeleted.subscribe(onNext: { [weak self] indexPath in
            guard let self = self else {return}
            self.viewModel.deleteProduct(index: indexPath.row)
        }).disposed(by: bag)

    }
    
    
    



}


//MARK:- Extension for TableView Delegate
extension MyProductsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
