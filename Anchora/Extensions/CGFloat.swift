//
//  CGFloat.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/9/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import Foundation


extension CGFloat: AnchoraDimensionRepresentable, AnchoraSizeAnchorsRepresentable {
   
    public func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutDimension, NSLayoutDimension>> {
        
        let constraint = AnchoraPartialConstraint<NSLayoutDimension>.init(anchor: nil, constant: self)
        
        return AnchoraContext.init(constraints: (constraint, constraint))
    }
    

    public func anchora() -> AnchoraContext<AnchoraPartialConstraint<NSLayoutDimension>> {
        
        let constraint = AnchoraPartialConstraint<NSLayoutDimension>.init(anchor: nil, constant: self)
        
        return AnchoraContext.init(constraints: constraint)
    }

}
