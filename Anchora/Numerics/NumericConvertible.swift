//
//  NumericConvertible.swift
//  Anchora
//
//  Created by Anthony Latsis on 7/21/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import Foundation

fileprivate protocol NumberConvertible: AnchoraSingleContextRepresentable, AnchoraPairContextRepresentable, AnchoraInterpolatedRelationRepresentable {
    init(_ value: Int)
    init(_ value: Float)
    init(_ value: Double)
    init(_ value: CGFloat)
    init(_ value: UInt8)
    init(_ value: Int8)
    init(_ value: UInt16)
    init(_ value: Int16)
    init(_ value: UInt32)
    init(_ value: Int32)
    init(_ value: UInt64)
    init(_ value: Int64)
    init(_ value: UInt)
}

extension NumberConvertible {

    private func convert<T: NumberConvertible>() -> T {
        switch self {
        case let x as CGFloat: return T(x)
        case let x as Float: return T(x)
        case let x as Int: return T(x)
        case let x as Double: return T(x)
        case let x as UInt8: return T(x)
        case let x as Int8: return T(x)
        case let x as UInt16: return T(x)
        case let x as Int16: return T(x)
        case let x as UInt32: return T(x)
        case let x as Int32: return T(x)
        case let x as UInt64: return T(x)
        case let x as Int64: return T(x)
        case let x as UInt: return T(x)
        default: fatalError()
        }
    }

    public func context() -> AnchoraPairContext<NSLayoutDimension, NSLayoutDimension, LayoutDefaultRelation> {

        let constraint = AnchoraConstraintContext<NSLayoutDimension>.init(anchor: nil, constant: convert())

        return AnchoraPairContext.init(constraints: (constraint, constraint))
    }

    public func context() -> AnchoraSingleContext<NSLayoutDimension, LayoutDefaultRelation> {

        let constraint = AnchoraConstraintContext<NSLayoutDimension>.init(anchor: nil, constant: convert())

        return AnchoraSingleContext.init(constraints: constraint)
    }

    public func relation() -> AnchoraInterpolatedRelation {

        return AnchoraInterpolatedRelation.init(relation: .equal, value: convert())
    }
}

extension CGFloat: NumberConvertible {}
extension Double: NumberConvertible {}
extension Float: NumberConvertible {}
extension Int: NumberConvertible {}
extension UInt8: NumberConvertible {}
extension Int8: NumberConvertible {}
extension UInt16: NumberConvertible {}
extension Int16: NumberConvertible {}
extension UInt32: NumberConvertible {}
extension Int32: NumberConvertible {}
extension UInt64: NumberConvertible {}
extension Int64: NumberConvertible {}
extension UInt: NumberConvertible {}

