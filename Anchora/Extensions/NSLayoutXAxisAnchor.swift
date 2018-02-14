//
//  NSLayoutXAxisAnchor.swift
//  ShapeIt
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

// MARK: METHODS WITH IMPLICIT RELATION

public extension NSLayoutXAxisAnchor {
    
    public func constraint(_ object: AnchoraXAxisAnchorRepresentable) -> NSLayoutConstraint {
        
        let constraints = object.anchora().constraints
        
        return self.constraint(constraints.relation, to: constraints.anchor!, multiplier: constraints.multiplier, constant: constraints.constant)
    }
}


// MARK: CONSTRAINT ACTIVATING METHODS

public extension NSLayoutXAxisAnchor {
    
    public func equals(_ object: AnchoraXAxisAnchorRepresentable) {
        
        self.constraint(object).isActive = true
    }
    
    public func lessOrEquals(_ object: AnchoraXAxisAnchorRepresentable) {
        
        object.anchora().constraints.relation = .lessThanOrEqual
        
        self.constraint(object).isActive = true
    }
    
    public func greaterOrEquals(_ object: AnchoraXAxisAnchorRepresentable) {
        
        object.anchora().constraints.relation = .greaterThanOrEqual
        
        self.constraint(object).isActive = true
    }
}


extension NSLayoutXAxisAnchor: AnchoraXAxisAnchorRepresentable {
    
    public func anchora() -> AnchoraContext<AnchoraPartialConstraint<NSLayoutXAxisAnchor>> {
        
        return AnchoraContext.init(constraints: AnchoraPartialConstraint.init(anchor: self))
    }
}

