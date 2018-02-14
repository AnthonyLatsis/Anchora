//
//  Operators.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/10/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit


// MARK: UNARY

prefix operator ==
prefix operator <=
prefix operator >=

public prefix func ==(rhs: AnchoraDimensionRepresentable) -> AnchoraRelation<AnchoraDimensionRepresentable> {
    
    return .equals(rhs)
}

public prefix func ==(rhs: AnchoraXAxisAnchorRepresentable) -> AnchoraRelation<AnchoraXAxisAnchorRepresentable> {
    
    return .equals(rhs)
}

public prefix func ==(rhs: AnchoraYAxisAnchorRepresentable) -> AnchoraRelation<AnchoraYAxisAnchorRepresentable> {
    
    return .equals(rhs)
}

public prefix func <=(rhs: AnchoraDimensionRepresentable) -> AnchoraRelation<AnchoraDimensionRepresentable> {
    
    return .lessOrEquals(rhs)
}

public prefix func <=(rhs: AnchoraXAxisAnchorRepresentable) -> AnchoraRelation<AnchoraXAxisAnchorRepresentable> {
    
    return .lessOrEquals(rhs)
}

public prefix func <=(rhs: AnchoraYAxisAnchorRepresentable) -> AnchoraRelation<AnchoraYAxisAnchorRepresentable> {
    
    return .lessOrEquals(rhs)
}

public prefix func >=(rhs: AnchoraDimensionRepresentable) -> AnchoraRelation<AnchoraDimensionRepresentable> {
    
    return .greaterOrEquals(rhs)
}

public prefix func >=(rhs: AnchoraXAxisAnchorRepresentable) -> AnchoraRelation<AnchoraXAxisAnchorRepresentable> {
    
    return .greaterOrEquals(rhs)
}

public prefix func >=(rhs: AnchoraYAxisAnchorRepresentable) -> AnchoraRelation<AnchoraYAxisAnchorRepresentable> {
    
    return .greaterOrEquals(rhs)
}


// MARK: MULTIPLICATION

public func *(lhs: NSLayoutDimension, rhs: CGFloat) -> AnchoraDimensionContext {
    
    return AnchoraDimensionContext.init(constraints: AnchoraPartialConstraint.init(anchor: lhs, multiplier: rhs))
}

public func *(lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> AnchoraXAxisAnchorContext {
    
    return AnchoraXAxisAnchorContext.init(constraints: AnchoraPartialConstraint.init(anchor: lhs, multiplier: rhs))
}

public func *(lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> AnchoraYAxisAnchorContext {
    
    return AnchoraYAxisAnchorContext.init(constraints: AnchoraPartialConstraint.init(anchor: lhs, multiplier: rhs))
}

public func *(lhs: CGFloat, rhs: NSLayoutDimension) -> AnchoraDimensionContext {
    
    return rhs * lhs
}

public func *(lhs: CGFloat, rhs: NSLayoutYAxisAnchor) -> AnchoraYAxisAnchorContext {
    
    return rhs * lhs
}

public func *(lhs: CGFloat, rhs: NSLayoutXAxisAnchor) -> AnchoraXAxisAnchorContext {
    
    return rhs * lhs
}

public func *(lhs: AnchoraSizeAnchors, rhs: (CGFloat, CGFloat)) -> AnchoraSizeAnchorsContext {
    
    return lhs * (.equals(rhs.0), .equals(rhs.1))
}

public func *(lhs: AnchoraSizeAnchors, rhs: (AnchoraRelation<CGFloat>, CGFloat)) -> AnchoraSizeAnchorsContext {
    
    return lhs * (rhs.0, .equals(rhs.1))
}

public func *(lhs: AnchoraSizeAnchors, rhs: (CGFloat, AnchoraRelation<CGFloat>)) -> AnchoraSizeAnchorsContext {
    
    return lhs * (.equals(rhs.0), rhs.1)
}

public func *(lhs: AnchoraSizeAnchors, rhs: (AnchoraRelation<CGFloat>, AnchoraRelation<CGFloat>)) -> AnchoraSizeAnchorsContext {
    
    func foo(_ relation: AnchoraRelation<CGFloat>) -> (NSLayoutRelation, CGFloat) {
        
        switch rhs.0 {
        case .equals(let float): return (.equal, float)
        case .greaterOrEquals(let float): return (.lessThanOrEqual, float)
        case .lessOrEquals(let float): return (.greaterThanOrEqual, float)
        }
    }
    let a = foo(rhs.0)
    let b = foo(rhs.1)
    
    let constr1 = AnchoraPartialConstraint.init(anchor: lhs.firstAnchor, relation: a.0, multiplier: a.1)
    let constr2 = AnchoraPartialConstraint.init(anchor: lhs.secondAnchor, relation: b.0, multiplier: b.1)
    
    return AnchoraSizeAnchorsContext.init(constraints: (constr1, constr2))
}



// MARK: DIVISION

public func /(lhs: NSLayoutDimension, rhs: CGFloat) -> AnchoraDimensionContext {
    
    return lhs * (1 / rhs)
}

public func /(lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> AnchoraXAxisAnchorContext {
    
    return lhs * (1 / rhs)
}

public func /(lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> AnchoraYAxisAnchorContext {
    
    return lhs * (1 / rhs)
}


// MARK: ADDITION

public func +(lhs: NSLayoutDimension, rhs: CGFloat) -> AnchoraDimensionContext {
    
    return AnchoraDimensionContext.init(constraints: AnchoraPartialConstraint.init(anchor: lhs, constant: rhs))
}

public func +(lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> AnchoraXAxisAnchorContext {
    
    return AnchoraXAxisAnchorContext.init(constraints: AnchoraPartialConstraint.init(anchor: lhs, constant: rhs))
}

public func +(lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> AnchoraYAxisAnchorContext {
    
    return AnchoraYAxisAnchorContext.init(constraints: AnchoraPartialConstraint.init(anchor: lhs, constant: rhs))
}

public func +(lhs: AnchoraDimensionContext, rhs: CGFloat) -> AnchoraDimensionContext {
    
    lhs.constraints.constant += rhs
    return lhs
}

public func +(lhs: AnchoraXAxisAnchorContext, rhs: CGFloat) -> AnchoraXAxisAnchorContext {
    
    lhs.constraints.constant += rhs
    return lhs
}

public func +(lhs: AnchoraYAxisAnchorContext, rhs: CGFloat) -> AnchoraYAxisAnchorContext {
    
    lhs.constraints.constant += rhs
    return lhs
}

public func +(lhs: CGFloat, rhs: AnchoraDimensionContext) -> AnchoraDimensionContext {
    
    return rhs + lhs
}

public func +(lhs: CGFloat, rhs: AnchoraXAxisAnchorContext) -> AnchoraXAxisAnchorContext {
    
    return rhs + lhs
}

public func +(lhs: CGFloat, rhs: AnchoraYAxisAnchorContext) -> AnchoraYAxisAnchorContext {
    
    return rhs + lhs
}


// MARK: SUBTRACTION

public func -(lhs: NSLayoutDimension, rhs: CGFloat) -> AnchoraDimensionContext {
    
    return lhs + (-rhs)
}

public func -(lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> AnchoraXAxisAnchorContext {
    
    return lhs + (-rhs)
}

public func -(lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> AnchoraYAxisAnchorContext {
    
    return lhs + (-rhs)
}

public func -(lhs: AnchoraDimensionContext, rhs: CGFloat) -> AnchoraDimensionContext {
    
    return lhs + (-rhs)
}

public func -(lhs: AnchoraXAxisAnchorContext, rhs: CGFloat) -> AnchoraXAxisAnchorContext {
    
    return lhs + (-rhs)
}

public func -(lhs: AnchoraYAxisAnchorContext, rhs: CGFloat) -> AnchoraYAxisAnchorContext {
    
    return lhs + (-rhs)
}



