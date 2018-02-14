//
//  NSLayoutYAxisAnchor.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

// MARK: METHODS WITH EXPLICIT RELATION

public extension NSLayoutYAxisAnchor {
    
    public func constraint(_ relation: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> NSLayoutConstraint {
        
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

// MARK: METHODS WITH IMPLICIT RELATION

public extension NSLayoutYAxisAnchor {
    
    public func constraint(_ object: AnchoraYAxisAnchorRepresentable) -> NSLayoutConstraint {
        
        return self.constraint(.equals(object))
    }
}

// MARK: CONSTRAINT ACTIVATING METHODS

public extension NSLayoutYAxisAnchor {
    
    public func equals(_ object: AnchoraYAxisAnchorRepresentable) {

        self.constraint(object).isActive = true
    }

    public func lessOrEquals(_ object: AnchoraYAxisAnchorRepresentable) {

        self.constraint(.lessOrEquals(object)).isActive = true
    }

    public func greaterOrEquals(_ object: AnchoraYAxisAnchorRepresentable) {

        self.constraint(.greaterOrEquals(object)).isActive = true
    }
}



