//
//  AnchoraAnchorPair.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/10/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

public class AnchoraAnchorPair<AnchorType1: AnyObject, AnchorType2: AnyObject> {

    var anchor1: NSLayoutAnchor<AnchorType1>
    var anchor2: NSLayoutAnchor<AnchorType2>

    init(_ first: NSLayoutAnchor<AnchorType1>, _ second: NSLayoutAnchor<AnchorType2>) {
        anchor1 = first
        anchor2 = second
    }

    public func equal<T: AnchoraPairContextRepresentable>(_ object: T) where T.AnchorType1 == AnchorType1, T.AnchorType2 == AnchorType2, T.RelationType == LayoutDefaultRelation {

        constrain(object)
    }

    public func constrain<T: AnchoraPairContextRepresentable>(_ object: T) where T.AnchorType1 == AnchorType1, T.AnchorType2 == AnchorType2 {

        for c in constraints(object) { c.activate() }
    }

    @discardableResult public func constraints<T: AnchoraPairContextRepresentable>(_ object: T) -> [NSLayoutConstraint] where T.AnchorType1 == AnchorType1, T.AnchorType2 == AnchorType2 {

        let constr1 = object.context().constraints.first
        let constr2 = object.context().constraints.second

        var result: [NSLayoutConstraint] = []

        result.append(anchor1.constraint(constr1.relation, to: constr1.anchor, multiplier: constr1.multiplier, constant: constr1.constant))
        result.append(anchor2.constraint(constr2.relation, to: constr2.anchor, multiplier: constr2.multiplier, constant: constr2.constant))
 
        return result
    }

    public func constrain<T: AnchoraSingleContextRepresentable, U: AnchoraSingleContextRepresentable>(_ first: T, _ second: U) where T.AnchorType == AnchorType1, U.AnchorType == AnchorType2 {

        for c in constraints(first, second) { c.activate() }
    }

    @discardableResult public func constraints<T: AnchoraSingleContextRepresentable, U: AnchoraSingleContextRepresentable>(_ first: T, _ second: U) -> [NSLayoutConstraint] where T.AnchorType == AnchorType1, U.AnchorType == AnchorType2 {

        let obj = AnchoraPairContext<T.AnchorType, U.AnchorType, T.RelationType>(constraints: (first.context().constraints, second.context().constraints))

        return constraints(obj)
    }
}

extension AnchoraAnchorPair: AnchoraPairContextRepresentable {
    public func context() -> AnchoraPairContext<AnchorType1, AnchorType2, LayoutDefaultRelation> {

        let constr1 = AnchoraConstraintContext(anchor: anchor1)
        let constr2 = AnchoraConstraintContext(anchor: anchor2)

        return AnchoraPairContext(constraints: (constr1, constr2))
    }
}

