//
//  NSLayoutYAxisAnchor.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

internal extension NSLayoutYAxisAnchor {
    
    internal func constraint(equalTo anchor: NSLayoutYAxisAnchor, multiplier m: CGFloat = 1, constant c: CGFloat = 0) -> NSLayoutConstraint {
        
        let c: NSLayoutConstraint = self.constraint(equalTo: anchor, constant: c)
        
        return NSLayoutConstraint.init(item: c.firstItem as Any, attribute: c.firstAttribute, relatedBy: c.relation, toItem: c.secondItem, attribute: c.secondAttribute, multiplier: m, constant: c.constant)
    }
    
    internal func constraint(lessOrEqualTo anchor: NSLayoutYAxisAnchor, multiplier m: CGFloat = 1, constant c: CGFloat = 0) -> NSLayoutConstraint {
        
        let c: NSLayoutConstraint = self.constraint(lessThanOrEqualTo: anchor, constant: c)
        
        return NSLayoutConstraint.init(item: c.firstItem as Any, attribute: c.firstAttribute, relatedBy: c.relation, toItem: c.secondItem, attribute: c.secondAttribute, multiplier: m, constant: c.constant)
    }
    
    internal func constraint(greaterOrEqualTo anchor: NSLayoutYAxisAnchor, multiplier m: CGFloat = 1, constant c: CGFloat = 0) -> NSLayoutConstraint {
        
        let c: NSLayoutConstraint = self.constraint(greaterThanOrEqualTo: anchor, constant: c)
        
        return NSLayoutConstraint.init(item: c.firstItem as Any, attribute: c.firstAttribute, relatedBy: c.relation, toItem: c.secondItem, attribute: c.secondAttribute, multiplier: m, constant: c.constant)
    }
}


// MARK: METHODS WITH EXPLICIT RELATION

public extension NSLayoutYAxisAnchor {
    
    public func constraint(_ relation: AnchoraRelation<Anchora<NSLayoutYAxisAnchor>>) -> NSLayoutConstraint {
        
        switch relation {
        case .equals(let anchora):
            
            return self.constraint(equalTo: anchora.anchor as! NSLayoutYAxisAnchor, multiplier: anchora.multiplier, constant: anchora.constant)
            
        case .greaterOrEquals(let anchora):
            
            return self.constraint(lessOrEqualTo: anchora.anchor as! NSLayoutYAxisAnchor, multiplier:
                anchora.multiplier, constant: anchora.constant)
            
        case .lessOrEquals(let anchora):
            
            return self.constraint(greaterOrEqualTo: anchora.anchor as! NSLayoutYAxisAnchor, multiplier: anchora.multiplier, constant: anchora.constant)
        }
    }
    
    public func constraint(_ relation: AnchoraRelation<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        
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

public extension NSLayoutYAxisAnchor {
    
    public func constraint(_ anchor: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        
        return self.constraint(equalTo: anchor)
    }
    
    public func constraint(_ anchora: Anchora<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        
        return self.constraint(.equals(anchora))
    }
}


// MARK: CONSTRAINT ACTIVATING METHODS

public extension NSLayoutYAxisAnchor {
    
    public func equals(_ anchor: NSLayoutYAxisAnchor) {
        
        self.constraint(anchor).isActive = true
    }
    
    public func lessOrEquals(_ anchor: NSLayoutYAxisAnchor) {
        
        self.constraint(.lessOrEquals(anchor)).isActive = true
    }
    
    public func greaterOrEquals(_ anchor: NSLayoutYAxisAnchor) {
        
        self.constraint(.greaterOrEquals(anchor)).isActive = true
    }
    
    public func equals(_ anchora: Anchora<NSLayoutYAxisAnchor>) {
        
        self.constraint(anchora).isActive = true
    }
    
    public func lessOrEquals(_ anchora: Anchora<NSLayoutYAxisAnchor>) {
        
        self.constraint(.lessOrEquals(anchora)).isActive = true
    }
    
    public func greaterOrEquals(_ anchora: Anchora<NSLayoutYAxisAnchor>) {
        
        self.constraint(.greaterOrEquals(anchora)).isActive = true
    }
}
