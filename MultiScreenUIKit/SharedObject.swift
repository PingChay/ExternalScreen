//
//  ShareObject.swift
//  MultiScreenUIKit
//
//  Created by Saran Nonkamjan on 5/3/2567 BE.
//

import UIKit
import Foundation
import Combine

class SharedObject {
    static let shared: SharedObject = .init()
    
    var bgColor: CurrentValueSubject<UIColor, Never> = .init(.white)
    var text: CurrentValueSubject<String, Never> = .init("Sample")
    var textColor: CurrentValueSubject<UIColor, Never> = .init(.black)
    var fontSize: CurrentValueSubject<CGFloat, Never> = .init(40)
    
    var image: CurrentValueSubject<UIImage, Never> = .init(.actions)
    
    var showImage: CurrentValueSubject<Bool, Never> = .init(false)
}
