//
//  TextColorViewController.swift
//  MultiScreenUIKit
//
//  Created by Saran Nonkamjan on 6/3/2567 BE.
//

import UIKit

class TextColorViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    let colors: [UIColor] = [.black, .blue, .red, .brown, .cyan, .darkGray, .brown, .magenta, .darkText, .green, .orange, .purple, .yellow]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Text Color"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TextColorViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        
        SharedObject.shared.textColor.send(color)
    }
}

extension TextColorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = .init(style: .default, reuseIdentifier: "cell")
        }
        
        guard let cell else {
            fatalError()
        }
        
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.accessibilityName
        
        return cell
    }
}
