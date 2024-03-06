//
//  ImageViewController.swift
//  MultiScreenUIKit
//
//  Created by Saran Nonkamjan on 6/3/2567 BE.
//

import UIKit

class ImageSetViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    let images: [UIImage] = [.actions, .add, .checkmark, .remove, .strokedCheckmark]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SharedObject.shared.showImage.send(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        SharedObject.shared.showImage.send(false)
    }
}

extension ImageSetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = images[indexPath.row]
        
        SharedObject.shared.image.send(image)
    }
}

extension ImageSetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = .init(style: .default, reuseIdentifier: "cell")
        }
        
        guard let cell else {
            fatalError()
        }
        
        let image = images[indexPath.row]
        
        cell.imageView?.image = image
        
        return cell
    }
}
