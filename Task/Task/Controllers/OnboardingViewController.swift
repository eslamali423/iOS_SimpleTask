//
//  ViewController.swift
//  Task
//
//  Created by Eslam Ali  on 17/04/2022.
//

import UIKit

class OnboardingViewController : UIViewController {
    
    //MARK:- Outlets
    private let image : UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode =  .scaleToFill
        imageview.clipsToBounds = true
        imageview.image = UIImage(named: "homeImage")
        imageview.layer.cornerRadius = 15
        return imageview
    }()
    
    private let titleLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.text = "Discover Your Dream Job Here"
        return label
    }()
    
    private let subTitleLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .darkGray
        label.textAlignment = .justified
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "labore et delore manga aliqua Ut. enim ad minim venim, quis nosturd execrictation ullamco labris"
        return label
    }()
    
    private let segmentedControll : UISegmentedControl = {
        let segment = UISegmentedControl (items: ["Sign Up","Log In"])
        segment.translatesAutoresizingMaskIntoConstraints =  false
        segment.selectedSegmentIndex = 0
        segment.layer.cornerRadius = 40
        let font = UIFont.systemFont(ofSize: 20,weight: .bold)
        segment.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        segment.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        return segment
    }()
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(image)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(segmentedControll)
        
        comfigureConstraints()
        
        
        
        
    }
    
    //MARK:- Constraints
    func comfigureConstraints()  {
        NSLayoutConstraint.activate([
            
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            image.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2.3),
            
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor,constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40),
            
           subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 30),
           subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
           subTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
      
            segmentedControll.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            segmentedControll.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            segmentedControll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -40),
            segmentedControll.heightAnchor.constraint(equalToConstant: 70),
            
            
            
        ])
    }
    
    
    //MARK:- Segment Controll Actions
    @objc func segmentedControlValueChanged () {
        if segmentedControll.selectedSegmentIndex == 1 {
            print ("login pressed ")
            let loginVc = LoginViewController()
            loginVc.modalPresentationStyle = .fullScreen
            present(loginVc, animated: true, completion: nil)
        }
    }
    
    
}

