//
//  TaskViewController.swift
//  ToDoApplication
//
//  Created by Anton Smirnov on 13.06.2020.
//  Copyright © 2020 Anton Smirnov. All rights reserved.
//

import UIKit
import RealmSwift

class TaskViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var textFiled:UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    private let realm = try! Realm()
    public var complitionHandler:(() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFiled.becomeFirstResponder()
        textFiled.delegate = self
        datePicker.setDate(Date(), animated: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSaveButton))
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textFiled.resignFirstResponder()
    
            return true
        }
    
    @IBAction func saveTask(_ sender: UIButton) {
        
        didTapSaveButton()
        
    }
    
    @objc func didTapSaveButton(){
        if let text = textFiled.text, !text.isEmpty {
            let date = datePicker.date
            
            realm.beginWrite()
            
            let newItem = ToDoListItem()
            newItem.date = date
            newItem.item = text
            realm.add(newItem)
            try! realm.commitWrite()
            
            complitionHandler?()
            
           navigationController?.popToRootViewController(animated: true)
            
        } else {
            
        }
    }
}
