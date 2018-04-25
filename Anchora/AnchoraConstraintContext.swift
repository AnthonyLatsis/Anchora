//
//  AnchoraConstraintContext.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/13/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

public final class AnchoraConstraintContext<T: AnyObject> {
    
    internal init(anchor: NSLayoutAnchor<T>?, relation: NSLayoutRelation = .equal, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) {
        
        self.anchor = anchor
        self.multiplier = multiplier
        self.constant = constant
        self.relation = relation
    }
    
    internal let anchor: NSLayoutAnchor<T>?
    
    internal var multiplier: CGFloat

    internal var constant: CGFloat
    
    internal var relation: NSLayoutRelation
}
