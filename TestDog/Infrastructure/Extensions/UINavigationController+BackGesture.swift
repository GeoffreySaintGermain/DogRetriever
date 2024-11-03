//
//  UINavigationController+BackGesture.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 02/11/2024.
//

import SwiftUI

extension UINavigationController: UIGestureRecognizerDelegate {
        
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
