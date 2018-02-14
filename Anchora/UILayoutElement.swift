//
//  UILayoutElement.swift
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

extension UILayoutElement {
    
    public var centerAnchors: AnchoraCenterAnchors { return AnchoraCenterAnchors.init(self) }
    
    public var sizeAnchors: AnchoraSizeAnchors { return AnchoraSizeAnchors.init(self) }
    
    public var leftRightAnchors: AnchoraLeftRightAnchors { return AnchoraLeftRightAnchors.init(self) }
    
    public var leadTrailAnchors: AnchoraLeadTrailAnchors { return AnchoraLeadTrailAnchors.init(self) }
    
    public var verticalAnchors: AnchoraVerticalAnchors { return AnchoraVerticalAnchors.init(self) }
    
    public var edgeAnchors: AnchoraEdgeAnchors { return AnchoraEdgeAnchors.init(self) }
    
    var constraint: AnchoraSingleConstraintFactory {
        
        return AnchoraSingleConstraintFactory.init(element: self)
    }
    
    var constraints: AnchoraMultipleConstraintFactory {
        
        return AnchoraMultipleConstraintFactory.init(element: self)
    }
}



extension UIView: UILayoutElement {}

extension UILayoutGuide: UILayoutElement {}
    

