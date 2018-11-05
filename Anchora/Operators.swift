//
//  Operators.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/10/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit


prefix operator ==
prefix operator <=
prefix operator >=

// MARK: EQUALS

public prefix func ==<T: AnchoraSingleContextRepresentable>(rhs: T) -> AnchoraSingleContext<T.AnchorType, NSLayoutRelation> where T.RelationType == LayoutDefaultRelation {

    let context = rhs.context()

    return AnchoraSingleContext<T.AnchorType, NSLayoutRelation>(constraints: context.constraints)
}

public prefix func ==<T: AnchoraPairContextRepresentable>(rhs: T) -> AnchoraPairContext<T.AnchorType1, T.AnchorType2, NSLayoutRelation> where T.RelationType == LayoutDefaultRelation {

    let context = rhs.context()

    return AnchoraPairContext<T.AnchorType1, T.AnchorType2, NSLayoutRelation>(constraints: context.constraints)
}


// MARK: LESS OR EQUALS

public prefix func <=<T: AnchoraSingleContextRepresentable>(rhs: T) -> AnchoraSingleContext<T.AnchorType, NSLayoutRelation> where T.RelationType == LayoutDefaultRelation {

    let context = rhs.context()

    context.constraints.relation = .lessThanOrEqual

    return AnchoraSingleContext<T.AnchorType, NSLayoutRelation>(constraints: context.constraints)
}

public prefix func <=<T: AnchoraPairContextRepresentable>(rhs: T) -> AnchoraPairContext<T.AnchorType1, T.AnchorType2, NSLayoutRelation> where T.RelationType == LayoutDefaultRelation {

    let context = rhs.context()

    context.constraints.first.relation = .lessThanOrEqual
    context.constraints.second.relation = .lessThanOrEqual

     return AnchoraPairContext<T.AnchorType1, T.AnchorType2, NSLayoutRelation>(constraints: context.constraints)
}


// MARK: GREATER OR EQUALS

public prefix func >=<T: AnchoraSingleContextRepresentable>(rhs: T) -> AnchoraSingleContext<T.AnchorType, NSLayoutRelation> where T.RelationType == LayoutDefaultRelation {

    let context = rhs.context()

    context.constraints.relation = .greaterThanOrEqual

    return AnchoraSingleContext<T.AnchorType, NSLayoutRelation>(constraints: context.constraints)
}

public prefix func >=<T: AnchoraPairContextRepresentable>(rhs: T) -> AnchoraPairContext<T.AnchorType1, T.AnchorType2, NSLayoutRelation> where T.RelationType == LayoutDefaultRelation {

    let context = rhs.context()

    context.constraints.first.relation = .greaterThanOrEqual
    context.constraints.second.relation = .greaterThanOrEqual

    return AnchoraPairContext<T.AnchorType1, T.AnchorType2, NSLayoutRelation>(constraints: context.constraints)
}


public prefix func ==(rhs: CGFloat) -> AnchoraInterpolatedRelation {

    return AnchoraInterpolatedRelation(relation: .equal, value: rhs)
}

public prefix func <=(rhs: CGFloat) -> AnchoraInterpolatedRelation {

    return AnchoraInterpolatedRelation(relation: .lessThanOrEqual, value: rhs)
}

public prefix func >=(rhs: CGFloat) -> AnchoraInterpolatedRelation {

    return AnchoraInterpolatedRelation(relation: .greaterThanOrEqual, value: rhs)
}


// MARK: MULTIPLICATION

public func *<T, U: NumberConvertible>(lhs: NSLayoutAnchor<T>, rhs: U) -> AnchoraSingleContext<T, LayoutDefaultRelation> {

    return AnchoraSingleContext(constraints: AnchoraConstraintContext(anchor: lhs, multiplier: rhs.cgFloat()))
}

public func *<T, U: NumberConvertible>(lhs: U, rhs: NSLayoutAnchor<T>) -> AnchoraSingleContext<T, LayoutDefaultRelation> {

    return rhs * lhs
}

public func *<T, U>(lhs: AnchoraAnchorPair<T, U>, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraPairContext<T, U, LayoutDefaultRelation> {

    let a = rhs.0.relation()
    let b = rhs.1.relation()

    let constr1 = AnchoraConstraintContext(anchor: lhs.anchor1, relation: a.rel, multiplier: a.value)
    let constr2 = AnchoraConstraintContext(anchor: lhs.anchor2, relation: b.rel, multiplier: b.value)

    return AnchoraPairContext(constraints: (constr1, constr2))
}

public func *<T, U, R, S>(lhs: AnchoraAnchorQuartet<T, U, R, S>, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraQuartetContext<T, U, R, S, LayoutDefaultRelation> {

    let a = rhs.0.relation()
    let b = rhs.1.relation()
    let c = rhs.2.relation()
    let d = rhs.3.relation()

    let constr1 = AnchoraConstraintContext(anchor: lhs.anchor1, relation: a.rel, multiplier: a.value)
    let constr2 = AnchoraConstraintContext(anchor: lhs.anchor2, relation: b.rel, multiplier: b.value)
    let constr3 = AnchoraConstraintContext(anchor: lhs.anchor3, relation: c.rel, multiplier: c.value)
    let constr4 = AnchoraConstraintContext(anchor: lhs.anchor4, relation: d.rel, multiplier: d.value)

    return AnchoraQuartetContext(constraints: (constr1, constr2, constr3, constr4))
}

public func *<T, U>(lhs: AnchoraAnchorPair<T, U>, rhs: CGFloat) -> AnchoraPairContext<T, U, LayoutDefaultRelation> {

    let constr1 = AnchoraConstraintContext(anchor: lhs.anchor1, relation: .equal, multiplier: rhs)
    let constr2 = AnchoraConstraintContext(anchor: lhs.anchor2, relation: .equal, multiplier: rhs)

    return AnchoraPairContext(constraints: (constr1, constr2))
}

public func *<T, U>(lhs: CGFloat, rhs: AnchoraAnchorPair<T, U>) -> AnchoraPairContext<T, U, LayoutDefaultRelation> {

    return rhs * lhs
}

// MARK: DIVISION

public func /<T, U: NumberConvertible>(lhs: NSLayoutAnchor<T>, rhs: U) -> AnchoraSingleContext<T, LayoutDefaultRelation> {

    return lhs * (1 / rhs.cgFloat())
}


// MARK: ADDITION

public func +<T, U: NumberConvertible>(lhs: NSLayoutAnchor<T>, rhs: U) -> AnchoraSingleContext<T, LayoutDefaultRelation> {

    return AnchoraSingleContext(constraints: AnchoraConstraintContext(anchor: lhs, constant: rhs.cgFloat()))
}

public func +<T, U: NumberConvertible>(lhs: AnchoraSingleContext<T, LayoutDefaultRelation>, rhs: U) -> AnchoraSingleContext<T, LayoutDefaultRelation> {

    lhs.constraints.constant += rhs.cgFloat()
    return lhs
}

public func +<T, U: NumberConvertible>(lhs: U, rhs: AnchoraSingleContext<T, LayoutDefaultRelation>) -> AnchoraSingleContext<T, LayoutDefaultRelation> {

    return rhs + lhs
}


public func +<T, U>(lhs: AnchoraAnchorPair<T, U>, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraPairContext<T, U, LayoutDefaultRelation> {

    let a = rhs.0.relation()
    let b = rhs.1.relation()

    let constr1 = AnchoraConstraintContext(anchor: lhs.anchor1, relation: a.rel, constant: a.value)
    let constr2 = AnchoraConstraintContext(anchor: lhs.anchor2, relation: b.rel, constant: b.value)

    return AnchoraPairContext(constraints: (constr1, constr2))
}

public func +<T, U, R, S>(lhs: AnchoraAnchorQuartet<T, U, R, S>, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraQuartetContext<T, U, R, S, LayoutDefaultRelation> {

    let a = rhs.0.relation()
    let b = rhs.1.relation()
    let c = rhs.2.relation()
    let d = rhs.3.relation()

    let constr1 = AnchoraConstraintContext(anchor: lhs.anchor1, relation: a.rel, constant: a.value)
    let constr2 = AnchoraConstraintContext(anchor: lhs.anchor2, relation: b.rel, constant: b.value)
    let constr3 = AnchoraConstraintContext(anchor: lhs.anchor3, relation: c.rel, constant: c.value)
    let constr4 = AnchoraConstraintContext(anchor: lhs.anchor4, relation: d.rel, constant: d.value)

    return AnchoraQuartetContext(constraints: (constr1, constr2, constr3, constr4))
}


public func +<T, U>(lhs: AnchoraAnchorPair<T, U>, rhs: CGFloat) -> AnchoraPairContext<T, U, LayoutDefaultRelation> {

    let constr1 = AnchoraConstraintContext(anchor: lhs.anchor1, relation: .equal, constant: rhs)
    let constr2 = AnchoraConstraintContext(anchor: lhs.anchor2, relation: .equal, constant: rhs)

    return AnchoraPairContext(constraints: (constr1, constr2))
}

public func +<T, U>(lhs: AnchoraPairContext<T, U, LayoutDefaultRelation>, rhs: (CGFloat, CGFloat)) -> AnchoraPairContext<T, U, LayoutDefaultRelation> {

    let context = lhs.context()

    context.constraints.first.constant += rhs.0
    context.constraints.second.constant += rhs.1

    return lhs
}

public func +<T, U, R, S>(lhs: AnchoraQuartetContext<T, U, R, S, LayoutDefaultRelation>, rhs: (CGFloat, CGFloat, CGFloat, CGFloat)) -> AnchoraQuartetContext<T, U, R, S, LayoutDefaultRelation> {

    let context = lhs.context()

    context.constraints.first.constant += rhs.0
    context.constraints.second.constant += rhs.1
    context.constraints.third.constant += rhs.2
    context.constraints.fourth.constant += rhs.3

    return lhs
}

// MARK: SUBTRACTION

public func -<T, U: NumberConvertible>(lhs: NSLayoutAnchor<T>, rhs: U) -> AnchoraSingleContext<T, LayoutDefaultRelation> {

    return AnchoraSingleContext(constraints: AnchoraConstraintContext(anchor: lhs, constant: -rhs.cgFloat()))
}


public func -<T, U: NumberConvertible>(lhs: AnchoraSingleContext<T, LayoutDefaultRelation>, rhs: U) -> AnchoraSingleContext<T, LayoutDefaultRelation> {

    lhs.constraints.constant -= rhs.cgFloat()
    return lhs
}

public func -<T, U>(lhs: AnchoraAnchorPair<T, U>, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraPairContext<T, U, LayoutDefaultRelation> {

    return lhs + (-rhs.0, -rhs.1)
}

public func -<T, U, R, S>(lhs: AnchoraAnchorQuartet<T, U, R, S>, rhs: (AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable, AnchoraInterpolatedRelationRepresentable)) -> AnchoraQuartetContext<T, U, R, S, LayoutDefaultRelation> {

    return lhs + (-rhs.0, -rhs.1, -rhs.2, -rhs.3)
}

public func -<T, U>(lhs: AnchoraPairContext<T, U, LayoutDefaultRelation>, rhs: (CGFloat, CGFloat)) -> AnchoraPairContext<T, U, LayoutDefaultRelation> {

    return lhs + (-rhs.0, -rhs.1)
}

public func -<T, U, R, S>(lhs: AnchoraQuartetContext<T, U, R, S, LayoutDefaultRelation>, rhs: (CGFloat, CGFloat, CGFloat, CGFloat)) -> AnchoraQuartetContext<T, U, R, S, LayoutDefaultRelation> {

    return lhs + (-rhs.0, -rhs.1, -rhs.2, -rhs.3)
}
