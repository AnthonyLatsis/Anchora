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

public prefix func ==(rhs: AnchoraDimensionRepresentable) -> AnchoraDimensionRepresentable {

    return rhs
}

public prefix func ==(rhs: AnchoraXAxisAnchorRepresentable) -> AnchoraXAxisAnchorRepresentable {
    
    return rhs
}

public prefix func ==(rhs: AnchoraYAxisAnchorRepresentable) -> AnchoraYAxisAnchorRepresentable {
    
    return rhs
}

public prefix func <=(rhs: AnchoraDimensionRepresentable) -> AnchoraDimensionRepresentable {
    
    rhs.anchora().constraints.relation = .lessThanOrEqual
    return rhs
}

public prefix func <=(rhs: AnchoraXAxisAnchorRepresentable) -> AnchoraXAxisAnchorRepresentable {
    
    rhs.anchora().constraints.relation = .lessThanOrEqual
    return rhs
}

public prefix func <=(rhs: AnchoraYAxisAnchorRepresentable) -> AnchoraYAxisAnchorRepresentable {
    
    rhs.anchora().constraints.relation = .lessThanOrEqual
    return rhs
}

public prefix func >=(rhs: AnchoraDimensionRepresentable) -> AnchoraDimensionRepresentable {
    
    rhs.anchora().constraints.relation = .greaterThanOrEqual
    return rhs
}

public prefix func >=(rhs: AnchoraXAxisAnchorRepresentable) -> AnchoraXAxisAnchorRepresentable {
    
    rhs.anchora().constraints.relation = .greaterThanOrEqual
    return rhs
}

public prefix func >=(rhs: AnchoraYAxisAnchorRepresentable) -> AnchoraYAxisAnchorRepresentable {
    
    rhs.anchora().constraints.relation = .greaterThanOrEqual
    return rhs
}

public prefix func ==(rhs: CGFloat) -> AnchoraInterpolatedRelation {
    
    return AnchoraInterpolatedRelation.init(relation: .equal, value: rhs)
}

public prefix func <=(rhs: CGFloat) -> AnchoraInterpolatedRelation {
    
    return AnchoraInterpolatedRelation.init(relation: .lessThanOrEqual, value: rhs)
}

public prefix func >=(rhs: CGFloat) -> AnchoraInterpolatedRelation {
    
    return AnchoraInterpolatedRelation.init(relation: .greaterThanOrEqual, value: rhs)
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

public func *(lhs: AnchoraSizeAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraSizeAnchorsContext {
    
    let a = rhs.0.relation()
    let b = rhs.1.relation()
    
    let constr1 = AnchoraPartialConstraint.init(anchor: lhs.firstAnchor, relation: a.rel, multiplier: a.value)
    let constr2 = AnchoraPartialConstraint.init(anchor: lhs.secondAnchor, relation: b.rel, multiplier: b.value)
    
    return AnchoraSizeAnchorsContext.init(constraints: (constr1, constr2))
}

public func *(lhs: AnchoraCenterAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraCenterAnchorsContext {
    
    let a = rhs.0.relation()
    let b = rhs.1.relation()
    
    let constr1 = AnchoraPartialConstraint.init(anchor: lhs.firstAnchor, relation: a.rel, multiplier: a.value)
    let constr2 = AnchoraPartialConstraint.init(anchor: lhs.secondAnchor, relation: b.rel, multiplier: b.value)
    
    return AnchoraCenterAnchorsContext.init(constraints: (constr1, constr2))
}

public func *(lhs: AnchoraLeftRightAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraLeftRightAnchorsContext {
    
    let a = rhs.0.relation()
    let b = rhs.1.relation()
    
    let constr1 = AnchoraPartialConstraint.init(anchor: lhs.firstAnchor, relation: a.rel, multiplier: a.value)
    let constr2 = AnchoraPartialConstraint.init(anchor: lhs.secondAnchor, relation: b.rel, multiplier: b.value)
    
    return AnchoraLeftRightAnchorsContext.init(constraints: (constr1, constr2))
}

public func *(lhs: AnchoraLeadTrailAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraLeadTrailAnchorsContext {
    
    let a = rhs.0.relation()
    let b = rhs.1.relation()
    
    let constr1 = AnchoraPartialConstraint.init(anchor: lhs.firstAnchor, relation: a.rel, multiplier: a.value)
    let constr2 = AnchoraPartialConstraint.init(anchor: lhs.secondAnchor, relation: b.rel, multiplier: b.value)
    
    return AnchoraLeadTrailAnchorsContext.init(constraints: (constr1, constr2))
}

public func *(lhs: AnchoraVerticalAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraVerticalAnchorsContext {
    
    let a = rhs.0.relation()
    let b = rhs.1.relation()
    
    let constr1 = AnchoraPartialConstraint.init(anchor: lhs.firstAnchor, relation: a.rel, multiplier: a.value)
    let constr2 = AnchoraPartialConstraint.init(anchor: lhs.secondAnchor, relation: b.rel, multiplier: b.value)
    
    return AnchoraVerticalAnchorsContext.init(constraints: (constr1, constr2))
}

public func *(lhs: AnchoraEdgeAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraEdgeAnchorsContext {
    
    let a = rhs.0.relation()
    let b = rhs.1.relation()
    let c = rhs.2.relation()
    let d = rhs.3.relation()
    
    let constr1 = AnchoraPartialConstraint.init(anchor: lhs.anchor1, relation: a.rel, multiplier: a.value)
    let constr2 = AnchoraPartialConstraint.init(anchor: lhs.anchor2, relation: b.rel, multiplier: b.value)
    let constr3 = AnchoraPartialConstraint.init(anchor: lhs.anchor3, relation: c.rel, multiplier: c.value)
    let constr4 = AnchoraPartialConstraint.init(anchor: lhs.anchor4, relation: d.rel, multiplier: d.value)
    
    return AnchoraEdgeAnchorsContext.init(constraints: (constr1, constr2, constr3, constr4))
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

public func +(lhs: AnchoraSizeAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraSizeAnchorsContext {
    
    let a = rhs.0.relation()
    let b = rhs.1.relation()
    
    let constr1 = AnchoraPartialConstraint.init(anchor: lhs.firstAnchor, relation: a.rel, constant: a.value)
    let constr2 = AnchoraPartialConstraint.init(anchor: lhs.secondAnchor, relation: b.rel, constant: b.value)
    
    return AnchoraSizeAnchorsContext.init(constraints: (constr1, constr2))
}

public func +(lhs: AnchoraCenterAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraCenterAnchorsContext {
    
    let a = rhs.0.relation()
    let b = rhs.1.relation()
    
    let constr1 = AnchoraPartialConstraint.init(anchor: lhs.firstAnchor, relation: a.rel, constant: a.value)
    let constr2 = AnchoraPartialConstraint.init(anchor: lhs.secondAnchor, relation: b.rel, constant: b.value)
    
    return AnchoraCenterAnchorsContext.init(constraints: (constr1, constr2))
}

public func +(lhs: AnchoraLeftRightAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraLeftRightAnchorsContext {
    
    let a = rhs.0.relation()
    let b = rhs.1.relation()
    
    let constr1 = AnchoraPartialConstraint.init(anchor: lhs.firstAnchor, relation: a.rel, constant: a.value)
    let constr2 = AnchoraPartialConstraint.init(anchor: lhs.secondAnchor, relation: b.rel, constant: b.value)
    
    return AnchoraLeftRightAnchorsContext.init(constraints: (constr1, constr2))
}

public func +(lhs: AnchoraLeadTrailAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraLeadTrailAnchorsContext {
    
    let a = rhs.0.relation()
    let b = rhs.1.relation()
    
    let constr1 = AnchoraPartialConstraint.init(anchor: lhs.firstAnchor, relation: a.rel, constant: a.value)
    let constr2 = AnchoraPartialConstraint.init(anchor: lhs.secondAnchor, relation: b.rel, constant: b.value)
    
    return AnchoraLeadTrailAnchorsContext.init(constraints: (constr1, constr2))
}

public func +(lhs: AnchoraVerticalAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraVerticalAnchorsContext {
    
    let a = rhs.0.relation()
    let b = rhs.1.relation()
    
    let constr1 = AnchoraPartialConstraint.init(anchor: lhs.firstAnchor, relation: a.rel, constant: a.value)
    let constr2 = AnchoraPartialConstraint.init(anchor: lhs.secondAnchor, relation: b.rel, constant: b.value)
    
    return AnchoraVerticalAnchorsContext.init(constraints: (constr1, constr2))
}

public func +(lhs: AnchoraEdgeAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraEdgeAnchorsContext {
    
    let a = rhs.0.relation()
    let b = rhs.1.relation()
    let c = rhs.2.relation()
    let d = rhs.3.relation()
    
    let constr1 = AnchoraPartialConstraint.init(anchor: lhs.anchor1, relation: a.rel, constant: a.value)
    let constr2 = AnchoraPartialConstraint.init(anchor: lhs.anchor2, relation: b.rel, constant: b.value)
    let constr3 = AnchoraPartialConstraint.init(anchor: lhs.anchor3, relation: c.rel, constant: c.value)
    let constr4 = AnchoraPartialConstraint.init(anchor: lhs.anchor4, relation: d.rel, constant: d.value)
    
    return AnchoraEdgeAnchorsContext.init(constraints: (constr1, constr2, constr3, constr4))
}

public func +(lhs: AnchoraSizeAnchorsContext, rhs: (CGFloat, CGFloat)) -> AnchoraSizeAnchorsContext {
    
    let anchora = lhs.anchora()
    
    anchora.constraints.first.constant += rhs.0
    anchora.constraints.second.constant += rhs.1
    
    return lhs
}

public func +(lhs: AnchoraCenterAnchorsContext, rhs: (CGFloat, CGFloat)) -> AnchoraCenterAnchorsContext {
    
    let anchora = lhs.anchora()
    
    anchora.constraints.first.constant += rhs.0
    anchora.constraints.second.constant += rhs.1
    
    return lhs
}

public func +(lhs: AnchoraLeftRightAnchorsContext, rhs: (CGFloat, CGFloat)) -> AnchoraLeftRightAnchorsContext {
    
    let anchora = lhs.anchora()
    
    anchora.constraints.first.constant += rhs.0
    anchora.constraints.second.constant += rhs.1
    
    return lhs
}

public func +(lhs: AnchoraLeadTrailAnchorsContext, rhs: (CGFloat, CGFloat)) -> AnchoraLeadTrailAnchorsContext {
    
    let anchora = lhs.anchora()
    
    anchora.constraints.first.constant += rhs.0
    anchora.constraints.second.constant += rhs.1
    
    return lhs
}

public func +(lhs: AnchoraVerticalAnchorsContext, rhs: (CGFloat, CGFloat)) -> AnchoraVerticalAnchorsContext {
    
    let anchora = lhs.anchora()
    
    anchora.constraints.first.constant += rhs.0
    anchora.constraints.second.constant += rhs.1
    
    return lhs
}

public func +(lhs: AnchoraEdgeAnchorsContext, rhs: (CGFloat, CGFloat, CGFloat, CGFloat)) -> AnchoraEdgeAnchorsContext {
    
    let anchora = lhs.anchora()
    
    anchora.constraints.first.constant += rhs.0
    anchora.constraints.second.constant += rhs.1
    anchora.constraints.third.constant += rhs.2
    anchora.constraints.fourth.constant += rhs.3
    
    return lhs
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

public func -(lhs: AnchoraSizeAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraSizeAnchorsContext {
    
    return lhs + (-rhs.0, -rhs.1)
}

public func -(lhs: AnchoraCenterAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraCenterAnchorsContext {
    
    return lhs + (-rhs.0, -rhs.1)
}

public func -(lhs: AnchoraLeftRightAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraLeftRightAnchorsContext {
    
    return lhs + (-rhs.0, -rhs.1)
}

public func -(lhs: AnchoraLeadTrailAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraLeadTrailAnchorsContext {
    
    return lhs + (-rhs.0, -rhs.1)
}

public func -(lhs: AnchoraVerticalAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraVerticalAnchorsContext {
    
    return lhs + (-rhs.0, -rhs.1)
}

public func -(lhs: AnchoraEdgeAnchors, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraEdgeAnchorsContext {
    
    return lhs + (-rhs.0, -rhs.1, -rhs.2, -rhs.3)
}

public func -(lhs: AnchoraSizeAnchorsContext, rhs: (CGFloat, CGFloat)) -> AnchoraSizeAnchorsContext {
    
    return lhs + (-rhs.0, -rhs.1)
}

public func -(lhs: AnchoraCenterAnchorsContext, rhs: (CGFloat, CGFloat)) -> AnchoraCenterAnchorsContext {
    
    return lhs + (-rhs.0, -rhs.1)
}

public func -(lhs: AnchoraLeftRightAnchorsContext, rhs: (CGFloat, CGFloat)) -> AnchoraLeftRightAnchorsContext {
    
    return lhs + (-rhs.0, -rhs.1)
}

public func -(lhs: AnchoraLeadTrailAnchorsContext, rhs: (CGFloat, CGFloat)) -> AnchoraLeadTrailAnchorsContext {
    
    return lhs + (-rhs.0, -rhs.1)
}

public func -(lhs: AnchoraVerticalAnchorsContext, rhs: (CGFloat, CGFloat)) -> AnchoraVerticalAnchorsContext {
    
    return lhs + (-rhs.0, -rhs.1)
}

public func -(lhs: AnchoraEdgeAnchorsContext, rhs: (CGFloat, CGFloat, CGFloat, CGFloat)) -> AnchoraEdgeAnchorsContext {
    
    return lhs + (-rhs.0, -rhs.1, -rhs.2, -rhs.3)
}
