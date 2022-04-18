//
//  AddProductViewController.swift
//  Task
//
//  Created by Eslam Ali  on 18/04/2022.
//

import UIKit
import ProgressHUD

class AddProductViewController: UIViewController {
    
    //MARK:- Vars
    var addProductViewModel = AddProductViewModel()
    var categoryViewModel = CategoryViewModel()
    var pickerView = UIPickerView()
    
    
    let imagePicker = UIImagePickerController()

    
    
    //MARK:- Outlets
    
    private let addImagesLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "Add Product Images"
        return label
    }()
    
    private  let addButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus",
                                withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .bold)), for: .normal)
        button.tintColor = .systemPink
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 15
        button.layer.shadowRadius = 10
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.borderWidth = 0.1
        button.layer.borderColor = UIColor.gray.cgColor
          button.addTarget(self, action: #selector(didtapAddImageButton), for: .touchUpInside)
        button.clipsToBounds = true
        
        return button
    }()
    
   
  
    
    private let productNameField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Product Name"
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.font = UIFont.systemFont(ofSize: 15)
        
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        
        
        return textField
    }()
    
    private let productInfoField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Product Info"
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.font = UIFont.systemFont(ofSize: 15)
        
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        
        
        return textField
    }()
    
    private let CategoryField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Category"
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.font = UIFont.systemFont(ofSize: 15)
        
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        
        
        return textField
    }()
    
    private let typeField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Item Type"
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.font = UIFont.systemFont(ofSize: 15)
        
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        
        
        return textField
    }()
    private let PriceField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Price"
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.keyboardType = .numberPad
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        
        
        return textField
    }()
    
    private  let doneButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        button.backgroundColor = .systemPink
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 20, weight : .medium)
        button.addTarget(self, action: #selector(didTapDoneButton), for: .touchUpInside)

        return button
    }()
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Add Prooduct"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        
        view.addSubview(addImagesLabel)
       
        view.addSubview(addButton)
        view.addSubview(productNameField)
        view.addSubview(productInfoField)
        view.addSubview(CategoryField)
        view.addSubview(typeField)
        view.addSubview(PriceField)
        view.addSubview(doneButton)

        imagePicker.delegate = self

        
        configureConstraints()
        getData()
        
        
        pickerView.delegate = self
        pickerView.dataSource = self
        CategoryField.inputView = pickerView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    configureConstraints()
    }
    //MARK:- Constraints
    func configureConstraints(){
        
       
        
        NSLayoutConstraint.activate([
            
            addImagesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            addImagesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
          
            
            addButton.topAnchor.constraint(equalTo: addImagesLabel.bottomAnchor,constant: 10),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addButton.widthAnchor.constraint(equalToConstant: 70),
            addButton.heightAnchor.constraint(equalToConstant: 70),
            
            productNameField.topAnchor.constraint(equalTo: addButton.bottomAnchor,constant: 10),
            productNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            productNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            productNameField.heightAnchor.constraint(equalToConstant: 70),
            
            productInfoField.topAnchor.constraint(equalTo: productNameField.bottomAnchor,constant: 10),
            productInfoField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            productInfoField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            productInfoField.heightAnchor.constraint(equalToConstant: 70),
            
            
            CategoryField.topAnchor.constraint(equalTo: productInfoField.bottomAnchor,constant: 10),
            CategoryField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            CategoryField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            CategoryField.heightAnchor.constraint(equalToConstant: 70),
            
            typeField.topAnchor.constraint(equalTo: CategoryField.bottomAnchor,constant: 10),
            typeField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            typeField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            typeField.heightAnchor.constraint(equalToConstant: 70),
            
            PriceField.topAnchor.constraint(equalTo: typeField.bottomAnchor,constant: 10),
            PriceField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            PriceField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            PriceField.heightAnchor.constraint(equalToConstant: 70),
            
            
            doneButton.topAnchor.constraint(equalTo: PriceField.bottomAnchor,constant: 10),
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            doneButton.heightAnchor.constraint(equalToConstant: 70),
            
        ])
        
    }
    
    //MARK:- Get Categories Data for PickerView
    func getData(){
        categoryViewModel.getCategoies { (_) in
            //
        }
    }
    
    //MARK:- Done Button Action
    @objc func didTapDoneButton(){
        guard let name = productNameField.text, !name.isEmpty,
             let info = productInfoField.text, !info.isEmpty,
            let category = CategoryField.text, !category.isEmpty,
            let type = typeField.text, !type.isEmpty,
            let price = PriceField.text, !price.isEmpty
             else {
            // TODO:- Add custom progressHUD
            ProgressHUD.showError("All fields are Required")
            return
        }
        
        let newProduct = Product(image: "placeholder", name: name, price: price, info: info, category: category, type: type)
        
        
        addProduct(product: newProduct)
        ProgressHUD.showSuccess("Product Added Successfully")
        navigationController?.popViewController(animated: true)
        
        
    }
    
    func addProduct(product: Product){
        addProductViewModel.addProduct(product: product)
        
    }
    
    //MARK:- Add Image Button Action
    @objc func didtapAddImageButton(){
        
        // open camera
        let actionAlert =  UIAlertController(title: "change Profile Picture", message: "", preferredStyle: .actionSheet)
        actionAlert.addAction(UIAlertAction(title: "Open Camera", style: .default, handler: { (handler) in
            
            self.photoFromCamera()
            
            
        }))
        
        // open camera roll
        actionAlert.addAction(UIAlertAction(title: "Choose From Camera Roll", style: .default, handler: { (handler) in
            
            
            self.photoFromLibrary()
            
            
        }))
        // to cancel
        actionAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { (handler) in
            return
        }))

        self.present(actionAlert, animated: true, completion: nil)
        
        
    }
    
    // photo from Libraray
    func photoFromLibrary() {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        imagePicker.modalPresentationStyle = .popover
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    //photo form Camera
    func  photoFromCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.modalPresentationStyle = .fullScreen
            present(imagePicker,animated: true,completion: nil)
        } else {
            noCamera()
        }
    }
    
    func noCamera(){
        let alertVC = UIAlertController(title: "No Camera", message: "Sorry, this device has no camera",preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
        
        alertVC.addAction(okAction)
        present( alertVC, animated: true, completion: nil)
    }
    
    
    
}
//MARK:- Extension For PickerView
extension AddProductViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return categoryViewModel.categoies.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryViewModel.categoies[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        CategoryField.text = categoryViewModel.categoies[row].name
        CategoryField.resignFirstResponder()
    }
    
    
}

//MARK:- Extension for Image Picker Controller
extension AddProductViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let  pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
           
            self.addButton.setImage(pickedImage, for: .normal)
          
            // TODO:- Covert Image to NSData to Set In core Data
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
 
    
    
    
}
