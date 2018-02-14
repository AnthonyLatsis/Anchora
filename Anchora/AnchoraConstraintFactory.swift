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
    
    func top(_ object: AnchoraYAxisAnchorRepresentable) -> ReturnType
    func bottom(_ object: AnchoraYAxisAnchorRepresentable) -> ReturnType
    func left(_ object: AnchoraXAxisAnchorRepresentable) -> ReturnType
    func right(_ object: AnchoraXAxisAnchorRepresentable) -> ReturnType
    func leading(_ object: AnchoraXAxisAnchorRepresentable) -> ReturnType
    func trailing(_ object: AnchoraXAxisAnchorRepresentable) -> ReturnType
    func centerX(_ object: AnchoraXAxisAnchorRepresentable) -> ReturnType
    func centerY(_ object: AnchoraYAxisAnchorRepresentable) -> ReturnType
    func height(_ object: AnchoraDimensionRepresentable) -> ReturnType
    func width(_ object: AnchoraDimensionRepresentable) -> ReturnType
}


public class AnchoraSingleConstraintFactory: AnchoraConstraintFactory {
    
    public typealias ReturnType = NSLayoutConstraint
    
    internal let element: UILayoutElement
    
    init(element: UILayoutElement) { self.element = element }
    
    @discardableResult public func top(_ object: AnchoraYAxisAnchorRepresentable) -> NSLayoutConstraint {
        
        return self.element.topAnchor.constraint(object)
    }
    @discardableResult public func bottom(_ object: AnchoraYAxisAnchorRepresentable) -> NSLayoutConstraint {
        
        return self.element.bottomAnchor.constraint(object)
    }
    @discardableResult public func left(_ object: AnchoraXAxisAnchorRepresentable) -> NSLayoutConstraint {
        
        return self.element.leftAnchor.constraint(object)
    }
    @discardableResult public func right(_ object: AnchoraXAxisAnchorRepresentable) -> NSLayoutConstraint {
        
        return self.element.rightAnchor.constraint(object)
    }
    @discardableResult public func leading(_ object: AnchoraXAxisAnchorRepresentable) -> NSLayoutConstraint {
        
        return self.element.leadingAnchor.constraint(object)
    }
    @discardableResult public func trailing(_ object: AnchoraXAxisAnchorRepresentable) -> NSLayoutConstraint {
        
        return self.element.trailingAnchor.constraint(object)
    }
    @discardableResult public func centerX(_ object: AnchoraXAxisAnchorRepresentable) -> NSLayoutConstraint {
        
        return self.element.centerXAnchor.constraint(object)
    }
    @discardableResult public func centerY(_ object: AnchoraYAxisAnchorRepresentable) -> NSLayoutConstraint {
        
        return self.element.centerYAnchor.constraint(object)
    }
    @discardableResult public func height(_ object: AnchoraDimensionRepresentable) -> NSLayoutConstraint {
        
        return self.element.heightAnchor.constraint(object)
    }
    @discardableResult public func width(_ object: AnchoraDimensionRepresentable) -> NSLayoutConstraint {
        
        return self.element.widthAnchor.constraint(object)
    }
}

public class AnchoraMultipleConstraintFactory: AnchoraConstraintFactory {

    internal let element: UILayoutElement
    
    init(element: UILayoutElement) { self.element = element }
    
    @discardableResult public func top(_ object: AnchoraYAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.topAnchor.constraint(object).activate()
        return self
    }
    @discardableResult public func bottom(_ object: AnchoraYAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.bottomAnchor.constraint(object).activate()
        return self
    }
    @discardableResult public func left(_ object: AnchoraXAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.leftAnchor.constraint(object).activate()
        return self
    }
    @discardableResult public func right(_ object: AnchoraXAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.rightAnchor.constraint(object).activate()
        return self
    }
    @discardableResult public func leading(_ object: AnchoraXAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.leadingAnchor.constraint(object).activate()
        return self
    }
    @discardableResult public func trailing(_ object: AnchoraXAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.trailingAnchor.constraint(object).activate()
        return self
    }
    @discardableResult public func centerX(_ object: AnchoraXAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.centerXAnchor.constraint(object).activate()
        return self
    }
    @discardableResult public func centerY(_ object: AnchoraYAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.centerYAnchor.constraint(object).activate()
        return self
    }
    @discardableResult public func height(_ object: AnchoraDimensionRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.heightAnchor.constraint(object).activate()
        return self
    }
    @discardableResult public func width(_ object: AnchoraDimensionRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.widthAnchor.constraint(object).activate()
        return self
    }
    
    @discardableResult public func center(_ first: AnchoraXAxisAnchorRepresentable, _ second: AnchoraYAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.centerXAnchor.constraint(first).activate()
        self.element.centerYAnchor.constraint(second).activate()
        return self
    }
    @discardableResult public func center(_ object: AnchoraCenterAnchorsRepresentable) -> AnchoraMultipleConstraintFactory {
        
        for constr in self.element.centerAnchors.constraints(object) { constr.activate() }
        
        return self
    }
    
    @discardableResult public func size(_ first: AnchoraDimensionRepresentable, _ second: AnchoraDimensionRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.widthAnchor.constraint(first).activate()
        self.element.heightAnchor.constraint(second).activate()
        return self
    }
    @discardableResult public func size(_ object: AnchoraSizeAnchorsRepresentable) -> AnchoraMultipleConstraintFactory {
        
        for constr in self.element.sizeAnchors.constraints(object) { constr.activate() }
        
        return self
    }
    
    @discardableResult public func leftRight(_ first: AnchoraXAxisAnchorRepresentable, _ second: AnchoraXAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.leftAnchor.constraint(first).activate()
        self.element.rightAnchor.constraint(second).activate()
        return self
    }
    @discardableResult public func leftRight(_ object: AnchoraLeftRightAnchorsRepresentable) -> AnchoraMultipleConstraintFactory {
        
        for constr in self.element.leftRightAnchors.constraints(object) { constr.activate() }
        
        return self
    }
    
    @discardableResult public func leadTrail(_ first: AnchoraXAxisAnchorRepresentable, _ second: AnchoraXAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.leadingAnchor.constraint(first).activate()
        self.element.trailingAnchor.constraint(second).activate()
        return self
    }
    @discardableResult public func leadTrail(_ object: AnchoraLeadTrailAnchorsRepresentable) -> AnchoraMultipleConstraintFactory {
        
        for constr in self.element.leadTrailAnchors.constraints(object) { constr.activate() }
        
        return self
    }
    
    @discardableResult public func vertical(_ first: AnchoraYAxisAnchorRepresentable, _ second: AnchoraYAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.topAnchor.constraint(first).activate()
        self.element.bottomAnchor.constraint(second).activate()
        return self
    }
    @discardableResult public func vertical(_ object: AnchoraVerticalAnchorsRepresentable) -> AnchoraMultipleConstraintFactory {
        
        for constr in self.element.verticalAnchors.constraints(object) { constr.activate() }
        
        return self
    }
    
    @discardableResult public func edges(_ first: AnchoraYAxisAnchorRepresentable, _ second: AnchoraXAxisAnchorRepresentable, _ third: AnchoraYAxisAnchorRepresentable, fourth: AnchoraXAxisAnchorRepresentable) -> AnchoraMultipleConstraintFactory {
        
        self.element.topAnchor.constraint(first).activate()
        self.element.leftAnchor.constraint(second).activate()
        self.element.bottomAnchor.constraint(third).activate()
        self.element.rightAnchor.constraint(fourth).activate()
        return self
    }
    @discardableResult public func edges(_ object: AnchoraEdgeAnchorsRepresentable) -> AnchoraMultipleConstraintFactory {
        
        for constr in self.element.edgeAnchors.constraints(object) { constr.activate() }
        
        return self
    }
}


