//
//  RelationRepresentable.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/20/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit.NSLayoutConstraint


public protocol RelationRepresentable {
    func relation() -> NSLayoutConstraint.Relation
}

extension RelationRepresentable {
    public func relation() -> NSLayoutConstraint.Relation {
        return .equal
    }
}

extension NSLayoutConstraint.Relation: RelationRepresentable {
    public func relation() -> NSLayoutConstraint.Relation {
        return self
    }
}

public class LayoutDefaultRelation: RelationRepresentable {}


