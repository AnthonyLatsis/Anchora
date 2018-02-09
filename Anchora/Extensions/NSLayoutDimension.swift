//
//  NSLayoutDimension.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

// MARK: CONSTRAINT CREATING METHODS WITH EXPLICIT RELATION

public extension NSLayoutDimension {
    
    public func constraint(_ relation: AnchoraRelation<Anchora<NSLayoutDimension>>) -> NSLayoutConstraint {
        
        switch relation {
        case .equals(let anchora):
            
            return self.constraint(equalTo: anchora.anchor as! NSLayoutDimension, multiplier: anchora.multiplier, constant: anchora.constant)
            
        case .greaterOrEquals(let anchora):
            
            return self.constraint(lessThanOrEqualTo: anchora.anchor as! NSLayoutDimension, multiplier:
                anchora.multiplier, constant: anchora.constant)
            
        case .lessOrEquals(let anchora):
            
            return self.constraint(greaterThanOrEqualTo: anchora.anchor as! NSLayoutDimension, multiplier: anchora.multiplier, constant: anchora.constant)
        }
    }
    
    public func constraint(_ relation: AnchoraRelation<NSLayoutDimension>) -> NSLayoutConstraint {
        
        switch relation {
        case .equals(let anchor):
            
            return self.constraint(equalTo: anchor)
            
        case .greaterOrEquals(let anchor):
            
            return self.constraint(lessThanOrEqualTo: anchor)
            
        case .lessOrEquals(let anchor):
            
            return self.constraint(greaterThanOrEqualTo: anchor)
        }
    }
    
    public func constraint(_ relation: AnchoraRelation<CGFloat>) -> NSLayoutConstraint {
        
        switch relation {
        case .equals(let float):
            
            return self.constraint(equalToConstant: float)
            
        case .greaterOrEquals(let float):
            
            return self.constraint(lessThanOrEqualToConstant: float)
            
        case .lessOrEquals(let float):
            
            return self.constraint(greaterThanOrEqualToConstant: float)
        }
    }
}

// MARK: CONSTRAINT CREATING METHODS WITH IMPLICIT EQUAL RELATION

public extension NSLayoutDimension {
    
    public func constraint(_ constant: CGFloat) -> NSLayoutConstraint {
        
        return self.constraint(equalToConstant: constant)
    }
    
    public func constraint(_ anchor: NSLayoutDimension) -> NSLayoutConstraint {
        
        return self.constraint(equalTo: anchor)
    }
    
    public func constraint(_ anchora: Anchora<NSLayoutDimension>) -> NSLayoutConstraint {
        
        return self.constraint(.equals(anchora))
    }
}

// MARK: CONSTRAINT ACTIVATING METHODS

public extension NSLayoutDimension {
    
    public func equals(_ constant: CGFloat) {
        
        self.constraint(constant).isActive = true
    }
    
    public func lessOrEquals(_ constant: CGFloat) {
        
        self.constraint(.lessOrEquals(constant)).isActive = true
    }
    
    public func greaterOrEquals(_ constant: CGFloat) {
        
        self.constraint(.greaterOrEquals(constant)).isActive = true
    }
    
    public func equals(_ anchor: NSLayoutDimension) {
        
        self.constraint(anchor).isActive = true
    }
    
    public func lessOrEquals(_ anchor: NSLayoutDimension) {
        
        self.constraint(.lessOrEquals(anchor)).isActive = true
    }
    
    public func greaterOrEquals(_ anchor: NSLayoutDimension) {
        
        self.constraint(.greaterOrEquals(anchor)).isActive = true
    }
    
    public func equals(_ anchora: Anchora<NSLayoutDimension>) {
        
        self.constraint(anchora).isActive = true
    }
    
    public func lessOrEquals(_ anchora: Anchora<NSLayoutDimension>) {
        
        self.constraint(.lessOrEquals(anchora)).isActive = true
    }
    
    public func greaterOrEquals(_ anchora: Anchora<NSLayoutDimension>) {
        
        self.constraint(.greaterOrEquals(anchora)).isActive = true
    }
}
