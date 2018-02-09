//
//  NSLayoutXAxisAnchor.swift
//  ShapeIt
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

internal extension NSLayoutXAxisAnchor {
    
    internal func constraint(equalTo anchor: NSLayoutXAxisAnchor, multiplier m: CGFloat = 1, constant c: CGFloat = 0) -> NSLayoutConstraint {
        
        let c: NSLayoutConstraint = self.constraint(equalTo: anchor, constant: c)
        
        return NSLayoutConstraint.init(item: c.firstItem as Any, attribute: c.firstAttribute, relatedBy: c.relation, toItem: c.secondItem, attribute: c.secondAttribute, multiplier: m, constant: c.constant)
    }
    
    internal func constraint(lessOrEqualTo anchor: NSLayoutXAxisAnchor, multiplier m: CGFloat = 1, constant c: CGFloat = 0) -> NSLayoutConstraint {
        
        let c: NSLayoutConstraint = self.constraint(lessThanOrEqualTo: anchor, constant: c)
        
        return NSLayoutConstraint.init(item: c.firstItem as Any, attribute: c.firstAttribute, relatedBy: c.relation, toItem: c.secondItem, attribute: c.secondAttribute, multiplier: m, constant: c.constant)
    }
    
    internal func constraint(greaterOrEqualTo anchor: NSLayoutXAxisAnchor, multiplier m: CGFloat = 1, constant c: CGFloat = 0) -> NSLayoutConstraint {
        
        let c: NSLayoutConstraint = self.constraint(greaterThanOrEqualTo: anchor, constant: c)
        
        return NSLayoutConstraint.init(item: c.firstItem as Any, attribute: c.firstAttribute, relatedBy: c.relation, toItem: c.secondItem, attribute: c.secondAttribute, multiplier: m, constant: c.constant)
    }
}

// MARK: METHODS WITH EXPLICIT RELATION

public extension NSLayoutXAxisAnchor {
    
    public func constraint(_ relation: AnchoraRelation<Anchora<NSLayoutXAxisAnchor>>) -> NSLayoutConstraint {
        
        switch relation {
        case .equals(let anchora):
            
            return self.constraint(equalTo: anchora.anchor as! NSLayoutXAxisAnchor, multiplier: anchora.multiplier, constant: anchora.constant)
            
        case .greaterOrEquals(let anchora):
            
            return self.constraint(lessOrEqualTo: anchora.anchor as! NSLayoutXAxisAnchor, multiplier:
                anchora.multiplier, constant: anchora.constant)
        
        case .lessOrEquals(let anchora):
            
            return self.constraint(greaterOrEqualTo: anchora.anchor as! NSLayoutXAxisAnchor, multiplier: anchora.multiplier, constant: anchora.constant)
        }
    }
    
    public func constraint(_ relation: AnchoraRelation<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        
        switch relation {
        case .equals(let anchor):
            
            return self.constraint(equalTo: anchor)
            
        case .greaterOrEquals(let anchor):
            
            return self.constraint(lessOrEqualTo: anchor)
            
        case .lessOrEquals(let anchor):
            
            return self.constraint(greaterOrEqualTo: anchor)
        }
    }
}


// MARK: METHODS WITH IMPLICIT EQUAL RELATION

public extension NSLayoutXAxisAnchor {
    
    public func constraint(_ anchor: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        
        return self.constraint(equalTo: anchor)
    }
    
    public func constraint(_ anchora: Anchora<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        
        return self.constraint(.equals(anchora))
    }
}


// MARK: CONSTRAINT ACTIVATING METHODS

public extension NSLayoutXAxisAnchor {
    
    public func equals(_ anchor: NSLayoutXAxisAnchor) {
        
        self.constraint(anchor).isActive = true
    }
    
    public func lessOrEquals(_ anchor: NSLayoutXAxisAnchor) {
        
        self.constraint(.lessOrEquals(anchor)).isActive = true
    }
    
    public func greaterOrEquals(_ anchor: NSLayoutXAxisAnchor) {
        
        self.constraint(.greaterOrEquals(anchor)).isActive = true
    }
    
    public func equals(_ anchora: Anchora<NSLayoutXAxisAnchor>) {
        
        self.constraint(anchora).isActive = true
    }
    
    public func lessOrEquals(_ anchora: Anchora<NSLayoutXAxisAnchor>) {
        
        self.constraint(.lessOrEquals(anchora)).isActive = true
    }
    
    public func greaterOrEquals(_ anchora: Anchora<NSLayoutXAxisAnchor>) {
        
        self.constraint(.greaterOrEquals(anchora)).isActive = true
    }
}
