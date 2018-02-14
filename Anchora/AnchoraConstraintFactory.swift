//
//  AnchoraConstraintFactory.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/9/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import Foundation


public protocol AnchoraConstraintFactory {
    
    associatedtype ReturnType
 
    func top(_ relation: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> ReturnType

    func bottom(_ relation: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> ReturnType
    
    func left(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> ReturnType
    
    func right(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> ReturnType
    
    func leading(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> ReturnType
    
    func trailing(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> ReturnType
    
    func centerX(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> ReturnType
    
    func centerY(_ relation: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> ReturnType
    
    func height(_ relation: AnchoraRelation<AnchoraDimensionRepresentable>) -> ReturnType
    
    func width(_ relation: AnchoraRelation<AnchoraDimensionRepresentable>) -> ReturnType
}

extension AnchoraConstraintFactory {
    
    @discardableResult public func top(_ object: AnchoraYAxisAnchorRepresentable) -> ReturnType {
        
        return self.top(.equals(object))
    }
    @discardableResult public func bottom(_ object: AnchoraYAxisAnchorRepresentable) -> ReturnType {
        
        return self.bottom(.equals(object))
    }
    @discardableResult public func left(_ object: AnchoraXAxisAnchorRepresentable) -> ReturnType {
        
        return self.left(.equals(object))
    }
    @discardableResult public func right(_ object: AnchoraXAxisAnchorRepresentable) -> ReturnType {
     
        return self.right(.equals(object))
    }
    @discardableResult public func leading(_ object: AnchoraXAxisAnchorRepresentable) -> ReturnType {
        
        return self.leading(.equals(object))
    }
    @discardableResult public func trailing(_ object: AnchoraXAxisAnchorRepresentable) -> ReturnType {
        
        return self.trailing(.equals(object))
    }
    @discardableResult public func centerX(_ object: AnchoraXAxisAnchorRepresentable) -> ReturnType {
        
        return self.centerX(.equals(object))
    }
    @discardableResult public func centerY(_ object: AnchoraYAxisAnchorRepresentable) -> ReturnType {
        
        return self.centerY(.equals(object))
    }
    @discardableResult public func height(_ object: AnchoraDimensionRepresentable) -> ReturnType {
        
        return self.height(.equals(object))
    }
    @discardableResult public func width(_ object: AnchoraDimensionRepresentable) -> ReturnType {
        
        return self.width(.equals(object))
    }
}


public class AnchoraSingleConstraintFactory: AnchoraConstraintFactory {
    
    internal let element: UILayoutElement
    
    init(element: UILayoutElement) { self.element = element }
    
    @discardableResult public func top(_ relation: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> NSLayoutConstraint {
        
        return self.element.topAnchor.constraint(relation)
    }
    
    @discardableResult public func bottom(_ relation: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> NSLayoutConstraint {
        
        return self.element.bottomAnchor.constraint(relation)
    }
    
    @discardableResult public func left(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> NSLayoutConstraint {
        
        return self.element.leftAnchor.constraint(relation)
    }

    @discardableResult public func right(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> NSLayoutConstraint {
        
        return self.element.rightAnchor.constraint(relation)
    }
    
    @discardableResult public func leading(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> NSLayoutConstraint {
        
        return self.element.leadingAnchor.constraint(relation)
    }
    
    @discardableResult public func trailing(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> NSLayoutConstraint {
        
        return self.element.trailingAnchor.constraint(relation)
    }
    
    @discardableResult public func centerX(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> NSLayoutConstraint {
        
        return self.element.centerXAnchor.constraint(relation)
    }
    
    @discardableResult public func centerY(_ relation: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> NSLayoutConstraint {
        
        return self.element.centerYAnchor.constraint(relation)
    }

    @discardableResult public func height(_ relation: AnchoraRelation<AnchoraDimensionRepresentable>) -> NSLayoutConstraint {
     
        return self.element.heightAnchor.constraint(relation)
    }
    
    @discardableResult public func width(_ relation: AnchoraRelation<AnchoraDimensionRepresentable>) -> NSLayoutConstraint {
        
        return self.element.widthAnchor.constraint(relation)
    }
}

public class AnchoraMultipleConstraintFactory: AnchoraConstraintFactory {

    internal let element: UILayoutElement
    
    init(element: UILayoutElement) { self.element = element }
    
    @discardableResult public func top(_ relation: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.topAnchor.constraint(relation).activate()
        return self
    }
    
    @discardableResult public func bottom(_ relation: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.bottomAnchor.constraint(relation).activate()
        return self
    }
    
    @discardableResult public func left(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.leftAnchor.constraint(relation).activate()
        return self
    }
    
    @discardableResult public func right(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.rightAnchor.constraint(relation).activate()
        return self
    }
    
    @discardableResult public func leading(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.leadingAnchor.constraint(relation).activate()
        return self
    }
 
    @discardableResult public func trailing(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.trailingAnchor.constraint(relation).activate()
        return self
    }
    
    @discardableResult public func centerX(_ relation: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.centerXAnchor.constraint(relation).activate()
        return self
    }
    
    @discardableResult public func centerY(_ relation: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.centerYAnchor.constraint(relation).activate()
        return self
    }

    @discardableResult public func height(_ relation: AnchoraRelation<AnchoraDimensionRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.heightAnchor.constraint(relation).activate()
        return self
    }

    @discardableResult public func width(_ relation: AnchoraRelation<AnchoraDimensionRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.widthAnchor.constraint(relation).activate()
        return self
    }
    
    @discardableResult public func center(_ first: AnchoraXAxisAnchorRepresentable, _ second: AnchoraYAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        return self.center(.equals(first), .equals(second))
    }
    @discardableResult public func center(_ first: AnchoraRelation<AnchoraXAxisAnchorRepresentable>, _ second: AnchoraYAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        return self.center(first, .equals(second))
    }
    @discardableResult public func center(_ first: AnchoraXAxisAnchorRepresentable, _ second: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        return self.center(.equals(first), second)
    }
    @discardableResult public func center(_ first: AnchoraRelation<AnchoraXAxisAnchorRepresentable>, _ second: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.centerXAnchor.constraint(first).activate()
        self.element.centerYAnchor.constraint(second).activate()
        return self
    }
    @discardableResult public func center(_ object: AnchoraCenterAnchorsRepresentable) -> AnchoraMultipleConstraintFactory {
        
        for constr in self.element.centerAnchors.constraints(object) { constr.activate() }
        
        return self
    }
    
    @discardableResult public func size(_ first: AnchoraDimensionRepresentable, _ second: AnchoraDimensionRepresentable) -> AnchoraMultipleConstraintFactory {
        
        return self.size(.equals(first), .equals(second))
    }
    @discardableResult public func size(_ first: AnchoraRelation<AnchoraDimensionRepresentable>, _ second: AnchoraDimensionRepresentable) -> AnchoraMultipleConstraintFactory {
        
        return self.size(first, .equals(second))
    }
    @discardableResult public func size(_ first: AnchoraDimensionRepresentable, _ second: AnchoraRelation<AnchoraDimensionRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        return self.size(.equals(first), second)
    }
    @discardableResult public func size(_ first: AnchoraRelation<AnchoraDimensionRepresentable>, _ second: AnchoraRelation<AnchoraDimensionRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.widthAnchor.constraint(first).activate()
        self.element.heightAnchor.constraint(second).activate()
        return self
    }
    @discardableResult public func size(_ object: AnchoraSizeAnchorsRepresentable) -> AnchoraMultipleConstraintFactory {
        
        for constr in self.element.sizeAnchors.constraints(object) { constr.activate() }
        
        return self
    }
    
    @discardableResult public func leftRight(_ first: AnchoraXAxisAnchorRepresentable, _ second: AnchoraXAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        return self.leftRight(.equals(first), .equals(second))
    }
    @discardableResult public func leftRight(_ first: AnchoraRelation<AnchoraXAxisAnchorRepresentable>, _ second: AnchoraXAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        return self.leftRight(first, .equals(second))
    }
    @discardableResult public func leftRight(_ first: AnchoraXAxisAnchorRepresentable, _ second: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        return self.leftRight(.equals(first), second)
    }
    @discardableResult public func leftRight(_ first: AnchoraRelation<AnchoraXAxisAnchorRepresentable>, _ second: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.leftAnchor.constraint(first).activate()
        self.element.rightAnchor.constraint(second).activate()
        return self
    }
    @discardableResult public func leftRight(_ object: AnchoraLeftRightAnchorsRepresentable) -> AnchoraMultipleConstraintFactory {
        
        for constr in self.element.leftRightAnchors.constraints(object) { constr.activate() }
        
        return self
    }
    
    @discardableResult public func leadTrail(_ first: AnchoraXAxisAnchorRepresentable, _ second: AnchoraXAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        return self.leadTrail(.equals(first), .equals(second))
    }
    @discardableResult public func leadTrail(_ first: AnchoraRelation<AnchoraXAxisAnchorRepresentable>, _ second: AnchoraXAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        return self.leadTrail(first, .equals(second))
    }
    @discardableResult public func leadTrail(_ first: AnchoraXAxisAnchorRepresentable, _ second: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        return self.leadTrail(.equals(first), second)
    }
    @discardableResult public func leadTrail(_ first: AnchoraRelation<AnchoraXAxisAnchorRepresentable>, _ second: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.leadingAnchor.constraint(first).activate()
        self.element.trailingAnchor.constraint(second).activate()
        return self
    }
    @discardableResult public func leadTrail(_ object: AnchoraLeadTrailAnchorsRepresentable) -> AnchoraMultipleConstraintFactory {
        
        for constr in self.element.leadTrailAnchors.constraints(object) { constr.activate() }
        
        return self
    }
    
    @discardableResult public func vertical(_ first: AnchoraYAxisAnchorRepresentable, _ second: AnchoraYAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        return self.vertical(.equals(first), .equals(second))
    }
    @discardableResult public func vertical(_ first: AnchoraRelation<AnchoraYAxisAnchorRepresentable>, _ second: AnchoraYAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        return self.vertical(first, .equals(second))
    }
    @discardableResult public func vertical(_ first: AnchoraYAxisAnchorRepresentable, _ second: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        return self.vertical(.equals(first), second)
    }                              
    @discardableResult public func vertical(_ first: AnchoraRelation<AnchoraYAxisAnchorRepresentable>, _ second: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> AnchoraMultipleConstraintFactory {
        
        self.element.topAnchor.constraint(first).activate()
        self.element.bottomAnchor.constraint(second).activate()
        return self
    }
    @discardableResult public func vertical(_ object: AnchoraVerticalAnchorsRepresentable) -> AnchoraMultipleConstraintFactory {
        
        for constr in self.element.leadTrailAnchors.constraints(object) { constr.activate() }
        
        return self
    }

}


