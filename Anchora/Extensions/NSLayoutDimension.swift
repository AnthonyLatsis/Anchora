//
//  NSLayoutDimension.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

internal extension NSLayoutDimension {
    
    internal func constraint(_ relation: NSLayoutRelation, constant c: CGFloat) -> NSLayoutConstraint {
        
        switch relation {
        case .equal: return self.constraint(equalToConstant: c)
        case .lessThanOrEqual: return self.constraint(lessThanOrEqualToConstant: c)
        case .greaterThanOrEqual: return self.constraint(greaterThanOrEqualToConstant: c)
        }
    }
}

// MARK: METHODS WITH IMPLICIT RELATION

public extension NSLayoutDimension {
    
    public func constraint(_ object: AnchoraDimensionRepresentable) -> NSLayoutConstraint {

        let constraint = object.anchora().constraints
        
        if let anchor = constraint.anchor {
            
            return self.constraint(equalTo: anchor, multiplier: constraint.multiplier, constant: constraint.constant)
        } else {
            return self.constraint(equalToConstant: constraint.constant)
        }
    }
}


// MARK: CONSTRAINT ACTIVATING METHODS

@nonobjc public extension NSLayoutDimension {
    
    public func equals(_ object: AnchoraDimensionRepresentable) {
        
        self.constraint(object).isActive = true
    }

    public func lessOrEquals(_ object: AnchoraDimensionRepresentable) {

        object.anchora().constraints.relation = .lessThanOrEqual
        
        self.constraint(object).isActive = true
    }

    public func greaterOrEquals(_ object: AnchoraDimensionRepresentable) {

        object.anchora().constraints.relation = .greaterThanOrEqual
        
        self.constraint(object).isActive = true
    }
}

extension NSLayoutDimension: AnchoraDimensionRepresentable {
    
    public func anchora() -> AnchoraContext<AnchoraPartialConstraint<NSLayoutDimension>> {
        
        return AnchoraContext.init(constraints: AnchoraPartialConstraint.init(anchor: self))
    }
}
