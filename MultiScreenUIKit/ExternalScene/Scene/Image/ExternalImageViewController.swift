//
//  ExternalImageViewController.swift
//  MultiScreenUIKit
//
//  Created by Saran Nonkamjan on 6/3/2567 BE.
//

import UIKit
import Combine

class ExternalImageViewController: UIViewController {
    private var dispose: Set<AnyCancellable> = .init()
    
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupObserver()
    }

    func setupObserver() {
        SharedObject
            .shared
            .image
            .sink(receiveValue: { [weak self] image in
                guard let self = self else { return }
                
                imageView.image = image
            }).store(in: &dispose)
    }
}
