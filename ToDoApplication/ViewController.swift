//
//  ViewController.swift
//  ToDoApplication
//
//  Created by Anton Smirnov on 13.06.2020.
//  Copyright © 2020 Anton Smirnov. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoListItem: Object {
    @objc dynamic var  item: String = ""
    @objc dynamic var  date: Date = Date()
    
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var table: UITableView!
    public var item: ToDoListItem?
    private var data = [ToDoListItem]()
    
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = realm.objects(ToDoListItem.self).map({ $0 })
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].item
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = data[indexPath.row]
        
        guard let viewController = storyboard?.instantiateViewController(identifier: "edit") as? EditViewController else {
            return
        }
        
        viewController.item = item
        
        viewController.deletionHandler = {[weak self] in
            
            self?.refresh()
            
        }
        
        viewController.navigationItem.largeTitleDisplayMode = .never
        viewController.title = item.item
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapAddButton(){
        guard let viewController = storyboard?.instantiateViewController(identifier: "task") as? TaskViewController else {
            return
        }
        
        viewController.complitionHandler = { [weak self] in
            self?.refresh()
        }
        viewController.title = "Add New Task"
        
        viewController.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func refresh() {
        data = realm.objects(ToDoListItem.self).map({ $0 })
        
        table.reloadData()
    }
    
}

