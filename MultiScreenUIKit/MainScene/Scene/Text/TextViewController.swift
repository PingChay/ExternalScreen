//
//  TextViewController.swift
//  MultiScreenUIKit
//
//  Created by Saran Nonkamjan on 5/3/2567 BE.
//

import UIKit

class TextViewController: UIViewController {
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Set Text"
        textView.text = SharedObject.shared.text.value
        
        textView.delegate = self
    }
}

extension TextViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        SharedObject.shared.text.send(textView.text)
    }
}
