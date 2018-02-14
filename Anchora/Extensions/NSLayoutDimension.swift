//
//  NSLayoutDimension.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

internal extension NSLayoutDimension {
    
    internal func constraint(_ relation: NSLayoutRelation, to anchor: NSLayoutDimension, multiplier m: CGFloat = 1, constant c: CGFloat = 0) -> NSLayoutConstraint {
        
        switch relation {
        case .equal:
            return self.constraint(equalTo: anchor, constant: c).with(m: m)
        case .lessThanOrEqual:
            return self.constraint(lessThanOrEqualTo: anchor, constant: c).with(m: m)
        case .greaterThanOrEqual:
            return self.constraint(greaterThanOrEqualTo: anchor, constant: c).with(m: m)
        }
    }
}

// MARK: CONSTRAINT CREATING METHODS WITH EXPLICIT RELATION

public extension NSLayoutDimension {
    
    public func constraint(_ relation: AnchoraRelation<AnchoraDimensionRepresentable>) -> NSLayoutConstraint {

        switch relation {
        case .equals(let object):

            let constraint = object.anchora().constraints
            
            if let anchor = constraint.anchor {
                
                return self.constraint(equalTo: anchor, multiplier: constraint.multiplier, constant: constraint.constant)
            } else {
                return self.constraint(equalToConstant: constraint.constant)
            }

        case .greaterOrEquals(let object):

             let constraint = object.anchora().constraints
            
            if let anchor = constraint.anchor {
                
                return self.constraint(greaterThanOrEqualTo: anchor, multiplier: constraint.multiplier, constant: constraint.constant)
            } else {
                return self.constraint(equalToConstant: constraint.constant)
            }

        case .lessOrEquals(let object):

            let constraint = object.anchora().constraints
            
            if let anchor = constraint.anchor {
                
                return self.constraint(lessThanOrEqualTo: anchor, multiplier: constraint.multiplier, constant: constraint.constant)
            } else {
                return self.constraint(equalToConstant: constraint.constant)
            }
        }
    }
}

// MARK: METHODS WITH IMPLICIT RELATION

public extension NSLayoutDimension {

    public func constraint(_ object: AnchoraDimensionRepresentable) -> NSLayoutConstraint {

        return self.constraint(.equals(object))
    }
}

// MARK: CONSTRAINT ACTIVATING METHODS

@nonobjc public extension NSLayoutDimension {
    
    public func equals(_ object: AnchoraDimensionRepresentable) {
        
        self.constraint(object).isActive = true
    }

    public func lessOrEquals(_ object: AnchoraDimensionRepresentable) {

        self.constraint(.lessOrEquals(object)).isActive = true
    }

    public func greaterOrEquals(_ object: AnchoraDimensionRepresentable) {

        self.constraint(.greaterOrEquals(object)).isActive = true
    }
}

