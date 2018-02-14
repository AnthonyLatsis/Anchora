//
//  AnchoraRepresentable.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/9/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

public protocol AnchoraDimensionRepresentable {
    
    func anchora() -> AnchoraContext<AnchoraPartialConstraint<NSLayoutDimension>>
}

public protocol AnchoraXAxisAnchorRepresentable {
    
    func anchora() -> AnchoraContext<AnchoraPartialConstraint<NSLayoutXAxisAnchor>>
}

public protocol AnchoraYAxisAnchorRepresentable {
    
    func anchora() -> AnchoraContext<AnchoraPartialConstraint<NSLayoutYAxisAnchor>>
}

public protocol AnchoraSizeAnchorsRepresentable {
    
    func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutDimension, NSLayoutDimension>>
}

public protocol AnchoraCenterAnchorsRepresentable {
    
    func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutXAxisAnchor, NSLayoutYAxisAnchor>>
}

public protocol AnchoraLeftRightAnchorsRepresentable {
    
    func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>>
}

public protocol AnchoraLeadTrailAnchorsRepresentable {
    
    func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>>
}

public protocol AnchoraVerticalAnchorsRepresentable {
    
    func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor>>
}

public protocol AnchoraEdgeAnchorsRepresentable {
    
    func anchora() -> AnchoraContext<PartialConstraintQuartet<NSLayoutYAxisAnchor, NSLayoutXAxisAnchor, NSLayoutYAxisAnchor, NSLayoutXAxisAnchor>>
}





