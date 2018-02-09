//
//  UIView.swift
//  Laser Nya
//
//  Created by Anthony Latsis on 18.11.16.
//  Copyright © 2016 Anthony Latsis. All rights reserved.
//

import UIKit

public protocol UILayoutElement {
    
    var bottomAnchor: NSLayoutYAxisAnchor {get}
    
    var centerXAnchor: NSLayoutXAxisAnchor {get}
    
    var centerYAnchor: NSLayoutYAxisAnchor {get}
    
    var heightAnchor: NSLayoutDimension {get}
    
    var leadingAnchor: NSLayoutXAxisAnchor {get}
    
    var leftAnchor: NSLayoutXAxisAnchor {get}
    
    var rightAnchor: NSLayoutXAxisAnchor {get}
    
    var topAnchor: NSLayoutYAxisAnchor {get}
    
    var trailingAnchor: NSLayoutXAxisAnchor {get}
    
    var widthAnchor: NSLayoutDimension {get}
}

extension UIView: UILayoutElement {
 
    public func center(x: AnchoraRelation<NSLayoutXAxisAnchor>, y: AnchoraRelation<NSLayoutYAxisAnchor>) {
        
        self.centerXAnchor.constraint(x).isActive = true
        self.centerYAnchor.constraint(y).isActive = true
    }
    
    public func center(in element: UILayoutElement, xM: CGFloat = 1.0, xC: CGFloat = 0.0,  yM: CGFloat = 1.0, yC: CGFloat = 0.0) {
        
        self.centerXAnchor.constraint(equalTo: element.centerXAnchor, multiplier: xM, constant: xC).isActive = true
        self.centerYAnchor.constraint(equalTo: element.centerYAnchor, multiplier: yM, constant: yC).isActive = true
    }
}

public extension UIView {
    
    public func setDimensions(width: AnchoraRelation<NSLayoutDimension>, height: AnchoraRelation<NSLayoutDimension>) {
        
        self.widthAnchor.constraint(width).isActive = true
        self.heightAnchor.constraint(height).isActive = true
    }
    
    public func setDimensions(width: CGFloat, height: AnchoraRelation<NSLayoutDimension>) {
        
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(height).isActive = true
    }
    
    public func setDimensions(width: AnchoraRelation<NSLayoutDimension>, height: CGFloat) {
        
        self.widthAnchor.constraint(width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    public func setDimensions(width: CGFloat, height: CGFloat) {
        
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}

public extension UIView {
    
    typealias Insets = (top: CGFloat?, left: CGFloat?, bottom: CGFloat?, right: CGFloat?)
    
    public func anchor(to element: UILayoutElement, insets: Insets = (0, 0, 0, 0)) {
        
        if let top = insets.top {
            self.topAnchor.constraint(equalTo: element.topAnchor, constant: top).isActive = true
        }
        if let left = insets.left {
            self.leftAnchor.constraint(equalTo: element.leftAnchor, constant: left).isActive = true
        }
        if let right = insets.right {
            self.rightAnchor.constraint(equalTo: element.rightAnchor, constant: -right).isActive = true
        }
        if let bottom = insets.bottom {
            self.bottomAnchor.constraint(equalTo: element.bottomAnchor, constant: -bottom).isActive = true
        }
    }
    
    public func anchor(top: AnchoraRelation<NSLayoutYAxisAnchor>? = nil, left: AnchoraRelation<NSLayoutXAxisAnchor>? = nil, bottom: AnchoraRelation<NSLayoutYAxisAnchor>? = nil, right: AnchoraRelation<NSLayoutXAxisAnchor>? = nil) {
        
        if let top = top {
            self.topAnchor.constraint(top).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(left).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(right).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(bottom).isActive = true
        }
    }
}
