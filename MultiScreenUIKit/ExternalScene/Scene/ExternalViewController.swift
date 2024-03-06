//
//  ExternalViewController.swift
//  MultiScreenUIKit
//
//  Created by Saran Nonkamjan on 5/3/2567 BE.
//

import UIKit
import Combine

class ExternalViewController: UIViewController {
    private var dispose: Set<AnyCancellable> = .init()
    
    @IBOutlet private weak var sampleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        setupObserver()
    }
    
    func setupObserver() {
        SharedObject
            .shared
            .text
            .map({ text -> String? in return text })
            .assign(to: \.text, on: sampleLabel)
            .store(in: &dispose)
        
        SharedObject
            .shared
            .textColor
            .assign(to: \.textColor, on: sampleLabel)
            .store(in: &dispose)
        
        SharedObject
            .shared
            .bgColor
            .map({ color -> UIColor? in return color })
            .assign(to: \.backgroundColor, on: view)
            .store(in: &dispose)
        
        SharedObject
            .shared
            .fontSize
            .sink(receiveValue: { [weak self] fontSize in
                guard let self = self else { return }
                
                sampleLabel.font = .systemFont(ofSize: fontSize)
            }).store(in: &dispose)
        
        SharedObject
            .shared
            .showImage
            .sink(receiveValue: { [weak self] isShowImage in
                guard let self = self else { return }
                
                if isShowImage {
                    navigationController?.pushViewController(ExternalImageViewController(), animated: true)
                } else {
                    navigationController?.popToRootViewController(animated: true)
                }
            }).store(in: &dispose)
    }
}
