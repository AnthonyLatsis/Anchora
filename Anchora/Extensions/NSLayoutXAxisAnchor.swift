//
//  NSLayoutXAxisAnchor.swift
//  ShapeIt
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

// MARK: METHODS WITH EXPLICIT RELATION

public extension NSLayoutXAxisAnchor {
    
    public func constraint(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> NSLayoutConstraint {
        
        switch relation {
        case .equals(let object):
            
            let constraints = object.anchora().constraints
            
            return self.constraint(.equal, to: constraints.anchor!, multiplier: constraints.multiplier, constant: constraints.constant)
            
        case .greaterOrEquals(let object):
            
            let constraints = object.anchora().constraints
            
            return self.constraint(.greaterThanOrEqual, to: constraints.anchor!, multiplier: constraints.multiplier, constant: constraints.constant)
            
        case .lessOrEquals(let object):
            
            let constraints = object.anchora().constraints
            
            return self.constraint(.lessThanOrEqual, to: constraints.anchor!, multiplier: constraints.multiplier, constant: constraints.constant)
        }
    }
}


// MARK: METHODS WITH IMPLICIT EQUAL RELATION

public extension NSLayoutXAxisAnchor {
    
    public func constraint(_ object: AnchoraXAxisAnchorRepresentable) -> NSLayoutConstraint {
        
        return self.constraint(.equals(object))
    }
}


// MARK: CONSTRAINT ACTIVATING METHODS

public extension NSLayoutXAxisAnchor {
    
    public func equals(_ object: AnchoraXAxisAnchorRepresentable) {
        
        self.constraint(object).isActive = true
    }
    
    public func lessOrEquals(_ object: AnchoraXAxisAnchorRepresentable) {
        
        self.constraint(.lessOrEquals(object)).isActive = true
    }
    
    public func greaterOrEquals(_ object: AnchoraXAxisAnchorRepresentable) {
        
        self.constraint(.greaterOrEquals(object)).isActive = true
    }
}


