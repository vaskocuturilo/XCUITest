//
//  EditViewController.swift
//  ToDoApplication
//
//  Created by Anton Smirnov on 13.06.2020.
//  Copyright © 2020 Anton Smirnov. All rights reserved.
//

import UIKit
import RealmSwift

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
        
        
        textField.text = item?.item
        dateLabel.text = Self.dateFormatter.string(from: item!.date)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didTapDelete))
        
    }
    
    
    @objc func didTapDelete(){
        
                guard let myItem = self.item else {
                    return
                }
        
                realm.beginWrite()
        
                realm.delete(myItem)
                try! realm.commitWrite()
        
                deletionHandler?()
                navigationController?.popToRootViewController(animated: true)
        
        }
}

