//
//  MainViewController.swift
//  MultiScreenUIKit
//
//  Created by Saran Nonkamjan on 5/3/2567 BE.
//

import UIKit

struct ActionType {
    let name: String
    let controller: UIViewController
}

class MainViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private lazy var actionType: [ActionType] = [
        .init(name: "Text", controller: TextViewController()),
        .init(name: "Text Color", controller: TextColorViewController()),
        .init(name: "Font Size", controller: FontSizeViewController()),
        .init(name: "Backgrond Color", controller: BGColorViewController()),
        .init(name: "Image", controller: ImageSetViewController())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let action = actionType[indexPath.row]
        
        navigationController?.pushViewController(action.controller, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actionType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = .init(style: .default, reuseIdentifier: "cell")
        }
        
        guard let cell else {
            fatalError()
        }
            
        let action = actionType[indexPath.row]
    
        cell.textLabel?.text = action.name
        
        return cell
    }
}

