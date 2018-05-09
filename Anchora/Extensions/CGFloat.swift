//
//  CGFloat.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/9/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import Foundation


extension CGFloat: AnchoraSingleContextRepresentable, AnchoraPairContextRepresentable, AnchoraInterpolatedRelationRepresentable {

    public func context() -> AnchoraPairContext<NSLayoutDimension, NSLayoutDimension, LayoutDefaultRelation> {

        let constraint = AnchoraConstraintContext<NSLayoutDimension>.init(anchor: nil, constant: self)

        return AnchoraPairContext.init(constraints: (constraint, constraint))
    }

    public func context() -> AnchoraSingleContext<NSLayoutDimension, LayoutDefaultRelation> {

        let constraint = AnchoraConstraintContext<NSLayoutDimension>.init(anchor: nil, constant: self)

        return AnchoraSingleContext.init(constraints: constraint)
    }

    public func relation() -> AnchoraInterpolatedRelation {

        return AnchoraInterpolatedRelation.init(relation: .equal, value: self)
    }
}
