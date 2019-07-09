//
//  AnchoraInterpolatedRelation.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/16/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit.NSLayoutConstraint

public protocol AnchoraInterpolatedRelationRepresentable {
    func relation() -> AnchoraInterpolatedRelation
}

public final class AnchoraInterpolatedRelation: AnchoraInterpolatedRelationRepresentable {

    internal fileprivate(set) var value: CGFloat

    internal let rel: NSLayoutConstraint.Relation

    init(relation: NSLayoutConstraint.Relation, value: CGFloat) {

        self.value = value
        self.rel = relation
    }

    public func relation() -> AnchoraInterpolatedRelation {
        return self
    }
}

prefix func -(rhs: AnchoraInterpolatedRelationRepresentable) ->
    AnchoraInterpolatedRelationRepresentable {

    let relation = rhs.relation()

    relation.value = -relation.value
    return relation
}
