//
//  ActionViewModel.swift
//  bi-ios-2018
//
//  Created by Dominik Vesely on 06/11/2018.
//  Copyright © 2018 ČVUT. All rights reserved.
//

import Foundation
import UIKit

class ActionViewModel {
    
    var selectedColor : UIColor = .red
    var selectedSize : Float = 10
    var shapes = [Shape]()
    var overView : String {
        get {
            return "Size: \(selectedSize) Color: \(selectedColor) Count: \(shapes.count)"
        }
    }
    
    var didUpdate : () -> () = {}
    
    func createShape(position: CGPoint) -> UIView {
        let size = selectedSize
        let rect = UIView(frame: CGRect(x: 0, y: 0, width: Double(size), height: Double(size)))
        rect.frame.origin = position
        rect.backgroundColor = selectedColor
        let shape = Shape(tag: shapes.count, color: selectedColor, size: selectedSize, origin: position)
        shapes.append(shape)
        didUpdate()
        return rect
    }
    
    @IBAction func colorForControl(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
        case 1: selectedColor = .green
        case 2: selectedColor = .blue
        default: selectedColor = .red
        }
        didUpdate()
    }
    
    @IBAction func sizeForControl(_ sender: UISlider) {
        selectedSize = sender.value
        didUpdate()
    }
    
    @IBAction func shapeForControl(_ sender: UISegmentedControl) {
       
    }
    
}
