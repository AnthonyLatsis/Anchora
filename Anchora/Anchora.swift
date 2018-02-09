//
//  Anchora.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

public enum AnchoraRelation<Object: Any> {

    case equals(Object)

    case lessOrEquals(Object)

    case greaterOrEquals(Object)
}

public class Anchora<AnchorType>: NSObject where AnchorType: AnyObject {

    let anchor: NSLayoutAnchor<AnchorType>

    fileprivate(set) var constant: CGFloat = 0.0

    fileprivate(set) var multiplier: CGFloat = 1.0

    fileprivate(set) var relation: NSLayoutRelation = .equal

    fileprivate init(anchor: NSLayoutAnchor<AnchorType>) {

        self.anchor = anchor
    }

    fileprivate init(anchora: Anchora<AnchorType>) {

        self.anchor = anchora.anchor
        self.constant = anchora.constant
        self.multiplier = anchora.multiplier
    }
}

// MARK: OPERATORS

public func *<AnchorType>(lhs: NSLayoutAnchor<AnchorType>, rhs: CGFloat) -> Anchora<AnchorType> {

    let anchora = Anchora.init(anchor: lhs)

    anchora.multiplier = rhs

    return anchora
}

public func *<AnchorType>(lhs: CGFloat, rhs: NSLayoutAnchor<AnchorType>) -> Anchora<AnchorType> {

    return rhs * lhs
}

public func +<AnchorType>(lhs: NSLayoutAnchor<AnchorType>, rhs: CGFloat) -> Anchora<AnchorType> {

    let anchora = Anchora.init(anchor: lhs)

    anchora.constant += rhs

    return anchora
}

public func +<AnchorType>(lhs: CGFloat, rhs: NSLayoutAnchor<AnchorType>) -> Anchora<AnchorType> {

    return rhs + lhs
}

public func -<AnchorType>(lhs: NSLayoutAnchor<AnchorType>, rhs: CGFloat) -> Anchora<AnchorType> {

    return lhs + (-rhs)
}

public func +<AnchorType>(lhs: Anchora<AnchorType>, rhs: CGFloat) -> Anchora<AnchorType> {

    let anchora = Anchora.init(anchora: lhs)

    anchora.constant += CGFloat(rhs)

    return anchora
}

public func -<AnchorType>(lhs: Anchora<AnchorType>, rhs: CGFloat) -> Anchora<AnchorType> {

    return lhs + (-rhs)
}

public func +<AnchorType>(lhs: CGFloat, rhs: Anchora<AnchorType>) -> Anchora<AnchorType> {

    return rhs + lhs
}

