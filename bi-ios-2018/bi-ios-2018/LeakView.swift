//
//  LeakView.swift
//  bi-ios-2018
//
//  Created by Dominik Vesely on 31/10/2018.
//  Copyright © 2018 ČVUT. All rights reserved.
//

import Foundation
import UIKit

class LeakView : UIView {
    
    var action : () -> () = {
        print("action")
    }
    let hugeArray = Array(0...100000)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(LeakView.tapGesture(gesture:)))
        gestureTap.numberOfTapsRequired = 1
        
        addGestureRecognizer(gestureTap)
    }
    
    @objc func tapGesture(gesture : UITapGestureRecognizer) {
        action()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}