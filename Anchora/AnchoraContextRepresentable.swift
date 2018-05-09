//
//  AnchoraContextRepresentable.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/9/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

public protocol AnchoraSingleContextRepresentable {

    associatedtype RelationType: RelationRepresentable

    associatedtype AnchorType: AnyObject

    func context() -> AnchoraSingleContext<AnchorType, RelationType>
}

public protocol AnchoraPairContextRepresentable {

    associatedtype RelationType: RelationRepresentable

    associatedtype AnchorType1: AnyObject
    associatedtype AnchorType2: AnyObject

    func context() -> AnchoraPairContext<AnchorType1, AnchorType2, RelationType>
}

public protocol AnchoraQuartetContextRepresentable {

    associatedtype RelationType: RelationRepresentable

    associatedtype AnchorType1: AnyObject
    associatedtype AnchorType2: AnyObject
    associatedtype AnchorType3: AnyObject
    associatedtype AnchorType4: AnyObject

    func context() -> AnchoraQuartetContext<AnchorType1, AnchorType2, AnchorType3, AnchorType4, RelationType>
}
