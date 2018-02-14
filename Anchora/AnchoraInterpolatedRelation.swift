//
//  AnchoraInterpolatedRelation.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/9/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

public protocol AnchoraInterpolatedRelationRepresentable {
    
    func relation() -> AnchoraInterpolatedRelation
}

public class AnchoraInterpolatedRelation: AnchoraInterpolatedRelationRepresentable {
    
    internal let rel: NSLayoutRelation
    
    internal fileprivate(set) var value: CGFloat
    
    internal init(relation: NSLayoutRelation, value: CGFloat) {
        
        self.rel = relation
        self.value = value
    }
    
    public func relation() -> AnchoraInterpolatedRelation {
        
        return self
    }
}

prefix func -(rhs: AnchoraInterpolatedRelationRepresentable) -> AnchoraInterpolatedRelationRepresentable {
    
    let relation = rhs.relation()
    
    relation.value = -relation.value
    
    return relation
}
