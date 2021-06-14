//
//  EditViewController.swift
//  ToDoApplication
//
//  Created by Anton Smirnov on 13.06.2020.
//  Copyright © 2020 Anton Smirnov. All rights reserved.
//

import UIKit
import RealmSwift

fileprivate let AccessabilityRoot = Accessibility.Screen.Edit.self
class EditViewController: UIViewController {
    public var item: ToDoListItem?
    private let realm = try! Realm()
    @IBOutlet var textField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    public var complitionHandler:(() -> Void)?
    public var deletionHandler:(() -> Void)?
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter =  DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = AccessabilityRoot.View
        
        textField.text = item?.item
        textField.accessibilityIdentifier = AccessabilityRoot.TaskField
        dateLabel.text = Self.dateFormatter.string(from: item!.date)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSaveButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didTapDelete))
    }
    @objc func didTapDelete(){
        
        guard let myItem = self.item else {
            return
        }
        
        let refreshAlert = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this?", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            self.realm.beginWrite()
            
            self.realm.delete(myItem)
            try! self.realm.commitWrite()
            
            self.deletionHandler?()
            self.navigationController?.popToRootViewController(animated: true)
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    @objc func didTapSaveButton(){
        guard let myItem = self.item else {
            return
        }
        if let text = textField.text, !text.isEmpty {
            realm.beginWrite()
            self.realm.delete(myItem)
            let newItem = ToDoListItem()
            newItem.item = text
            realm.add(newItem)
            try! realm.commitWrite()
            self.deletionHandler?()
            navigationController?.popToRootViewController(animated: true)
        } else {
            
        }
    }
}

