//
//  RelationRepresentable.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/20/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

public struct SomeOne {
    var i = 0
}
public func someone() -> SomeOne {
    return SomeOne()
}

public protocol RelationRepresentable {
    
    func relation() -> NSLayoutRelation
}

extension RelationRepresentable {
    
    public func relation() -> NSLayoutRelation {
        
        return .equal
    }
}

extension NSLayoutRelation: RelationRepresentable {
    
    public func relation() -> NSLayoutRelation {
        
        return self
    }
}

public class LayoutDefaultRelation: RelationRepresentable {
    
    public func relation() -> NSLayoutRelation {
        
        return .equal
    }
}


