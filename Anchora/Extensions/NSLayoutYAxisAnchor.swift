//
//  NSLayoutYAxisAnchor.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit


// MARK: METHODS WITH IMPLICIT RELATION

public extension NSLayoutYAxisAnchor {
    
    public func constraint(_ object: AnchoraYAxisAnchorRepresentable) -> NSLayoutConstraint {
        
        let constraints = object.anchora().constraints
        
        return self.constraint(constraints.relation, to: constraints.anchor!, multiplier: constraints.multiplier, constant: constraints.constant)
    }
}

// MARK: CONSTRAINT ACTIVATING METHODS

public extension NSLayoutYAxisAnchor {
    
    public func equals(_ object: AnchoraYAxisAnchorRepresentable) {

        self.constraint(object).isActive = true
    }

    public func lessOrEquals(_ object: AnchoraYAxisAnchorRepresentable) {
        
        object.anchora().constraints.relation = .lessThanOrEqual
        
        self.constraint(object).isActive = true
    }
    
    public func greaterOrEquals(_ object: AnchoraYAxisAnchorRepresentable) {
        
        object.anchora().constraints.relation = .greaterThanOrEqual
        
        self.constraint(object).isActive = true
    }
}

extension NSLayoutYAxisAnchor: AnchoraYAxisAnchorRepresentable {
    
    public func anchora() -> AnchoraContext<AnchoraPartialConstraint<NSLayoutYAxisAnchor>> {
        
        return AnchoraContext.init(constraints: AnchoraPartialConstraint.init(anchor: self))
    }
}


