//
//  AnchoraPartialConstraint.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/13/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

public class AnchoraPartialConstraint<T> {
    
    internal init(anchor: T?, relation: NSLayoutRelation = .equal, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0)
    {
        self.anchor = anchor
        self.relation = relation
        self.multiplier = multiplier
        self.constant = constant
    }
    internal let anchor: T?
    
    internal var relation: NSLayoutRelation
    
    internal var multiplier: CGFloat

    internal var constant: CGFloat
}
