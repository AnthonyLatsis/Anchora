//
//  Double.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/10/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import Foundation

extension Double: AnchoraDimensionRepresentable {
    
    public func anchora() -> AnchoraContext<AnchoraPartialConstraint<NSLayoutDimension>> {
        
        return CGFloat(self).anchora()
    }
}
