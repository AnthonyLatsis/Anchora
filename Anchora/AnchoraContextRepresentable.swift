//
//  AnchoraContextRepresentable.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/9/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

public protocol AnchoraSingleContextRepresentable {

    associatedtype RelationType: RelationRepresentable
    
    associatedtype AnchorType
    
    func context() -> AnchoraSingleContext<AnchorType, RelationType>
}

public protocol AnchoraPairContextRepresentable {

    associatedtype RelationType: RelationRepresentable
    
    associatedtype AnchorType1
    associatedtype AnchorType2
    
    func context() -> AnchoraPairContext<AnchorType1, AnchorType2, RelationType>
}

public protocol AnchoraQuartetContextRepresentable {

    associatedtype RelationType: RelationRepresentable
    
    associatedtype AnchorType1
    associatedtype AnchorType2
    associatedtype AnchorType3
    associatedtype AnchorType4
    
    func context() -> AnchoraQuartetContext<AnchorType1, AnchorType2, AnchorType3, AnchorType4, RelationType>
}
