//
//  Int.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/10/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import Foundation


extension Int: AnchoraSingleContextRepresentable, AnchoraPairContextRepresentable, AnchoraInterpolatedRelationRepresentable {
    
    public func context() -> AnchoraSingleContext<NSLayoutDimension, LayoutDefaultRelation> {
         return CGFloat(self).context()
    }
    
    public func context() -> AnchoraPairContext<NSLayoutDimension, NSLayoutDimension, LayoutDefaultRelation> {
         return CGFloat(self).context()
    }

    public func relation() -> AnchoraInterpolatedRelation {
        
        return CGFloat(self).relation()
    }
    
//    public func context() -> AnchoraPairContext<NSLayoutDimension, NSLayoutDimension, LayoutDefaultRelation> {
//
//        return CGFloat(self).context()
//    }
//
//    public func context() -> AnchoraSingleContext<NSLayoutDimension, LayoutDefaultRelation> {
//
//        return CGFloat(self).context()
//    }
}
