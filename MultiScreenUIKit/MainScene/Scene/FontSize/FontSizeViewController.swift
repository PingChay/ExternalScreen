//
//  FontSizeViewController.swift
//  MultiScreenUIKit
//
//  Created by Saran Nonkamjan on 6/3/2567 BE.
//

import UIKit

class FontSizeViewController: UIViewController {
    
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var sizeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Font Size"
        
        sizeLabel.text = "\(SharedObject.shared.fontSize.value)"
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        SharedObject.shared.fontSize.send(CGFloat(sender.value))
        
        sizeLabel.text = "\(sender.value)"
    }
}
