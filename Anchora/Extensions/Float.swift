//
//  Float.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/10/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import Foundation

extension Float: AnchoraDimensionRepresentable, AnchoraSizeAnchorsRepresentable, AnchoraInterpolatedRelationRepresentable {
    
    public func anchora() -> AnchoraContext<(first: AnchoraPartialConstraint<NSLayoutDimension>, second: AnchoraPartialConstraint<NSLayoutDimension>)> {
        
        return CGFloat(self).anchora()
    }
    
    public func relation() -> AnchoraInterpolatedRelation {
        
        return CGFloat(self).relation()
    }
    
    public func anchora() -> AnchoraContext<AnchoraPartialConstraint<NSLayoutDimension>> {
        
        return CGFloat(self).anchora()
    }
}

