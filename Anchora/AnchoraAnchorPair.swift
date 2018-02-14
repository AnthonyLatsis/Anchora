//
//  AnchoraAnchorPair.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/10/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit


public class AnchoraAnchorPair<AnchoraRepresentable1, AnchoraRepresentable2, AnchorType1, AnchorType2> {
    
    internal var firstAnchor: AnchorType1? = nil
    internal var secondAnchor: AnchorType2? = nil
    
    internal init(_ element: UILayoutElement) {}
    
    public func constraints(_ first: AnchoraRepresentable1, _ second: AnchoraRepresentable2) -> [NSLayoutConstraint] {
        
        return self.constraints(.equals(first), .equals(second))
    }
    public func constraints(_ first: AnchoraRelation<AnchoraRepresentable1>, _ second: AnchoraRepresentable2) -> [NSLayoutConstraint] {
        
        return self.constraints(first, .equals(second))
    }
    public func constraints(_ first: AnchoraRepresentable1, _ second: AnchoraRelation<AnchoraRepresentable2>) -> [NSLayoutConstraint] {
        
        return self.constraints(.equals(first), second)
    }
    public func constraints(_ first: AnchoraRelation<AnchoraRepresentable1>, _ second: AnchoraRelation<AnchoraRepresentable2>) -> [NSLayoutConstraint] {

        return []
    }
}

public class AnchoraCenterAnchors: AnchoraAnchorPair<AnchoraXAxisAnchorRepresentable, AnchoraYAxisAnchorRepresentable, NSLayoutXAxisAnchor, NSLayoutYAxisAnchor> {
    
    override init(_ element: UILayoutElement) {
        
        self.firstAnchor = element.centerXAnchor
        self.secondAnchor = element.centerYAnchor
    }
    
    override public func constraints(_ first: AnchoraRelation<AnchoraXAxisAnchorRepresentable>, _ second: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> [NSLayoutConstraint] {
        
        return [self.firstAnchor!.constraint(first), self.secondAnchor!.constraint(second)]
    }
    public func constraints(_ object: AnchoraCenterAnchorsRepresentable) -> [NSLayoutConstraint] {
        
        let constr1 = object.anchora().constraints.first
        let constr2 = object.anchora().constraints.second
        
        let one = self.firstAnchor!.constraint(constr1.relation, to: constr1.anchor!, multiplier: constr1.multiplier, constant: constr1.constant)
        let two = self.secondAnchor!.constraint(constr2.relation, to: constr2.anchor!, multiplier: constr2.multiplier, constant: constr2.constant)
        
        return [one, two]
    }
}

public class AnchoraSizeAnchors: AnchoraAnchorPair<AnchoraDimensionRepresentable, AnchoraDimensionRepresentable, NSLayoutDimension, NSLayoutDimension> {
    
     override init(_ element: UILayoutElement) {
        
        self.firstAnchor = element.widthAnchor
        self.secondAnchor = element.heightAnchor
    }
    
    override public func constraints(_ first: AnchoraRelation<AnchoraDimensionRepresentable>, _ second: AnchoraRelation<AnchoraDimensionRepresentable>) -> [NSLayoutConstraint] {
        
        return [self.firstAnchor!.constraint(first), self.secondAnchor!.constraint(second)]
    }
    public func constraints(_ object: AnchoraSizeAnchorsRepresentable) -> [NSLayoutConstraint] {
        
        let constr1 = object.anchora().constraints.first
        let constr2 = object.anchora().constraints.second
        
        let one = self.firstAnchor!.constraint(constr1.relation, to: constr1.anchor!, multiplier: constr1.multiplier, constant: constr1.constant)
        let two = self.secondAnchor!.constraint(constr2.relation, to: constr2.anchor!, multiplier: constr2.multiplier, constant: constr2.constant)
        
        return [one, two]
    }
}

public class AnchoraLeftRightAnchors: AnchoraAnchorPair<AnchoraXAxisAnchorRepresentable, AnchoraXAxisAnchorRepresentable, NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
    
    override init(_ element: UILayoutElement) {
        
        self.firstAnchor = element.leftAnchor
        self.secondAnchor = element.rightAnchor
    }
    
    override public func constraints(_ first: AnchoraRelation<AnchoraXAxisAnchorRepresentable>, _ second: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> [NSLayoutConstraint] {
        
        return [self.firstAnchor!.constraint(first), self.secondAnchor!.constraint(second)]
    }
    public func constraints(_ object: AnchoraLeftRightAnchorsRepresentable) -> [NSLayoutConstraint] {
        
        let constr1 = object.anchora().constraints.first
        let constr2 = object.anchora().constraints.second
        
        let one = self.firstAnchor!.constraint(constr1.relation, to: constr1.anchor!, multiplier: constr1.multiplier, constant: constr1.constant)
        let two = self.secondAnchor!.constraint(constr2.relation, to: constr2.anchor!, multiplier: constr2.multiplier, constant: constr2.constant)
        
        return [one, two]
    }
}

public class AnchoraLeadTrailAnchors: AnchoraAnchorPair<AnchoraXAxisAnchorRepresentable, AnchoraXAxisAnchorRepresentable, NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
    
    override init(_ element: UILayoutElement) {
        
        self.firstAnchor = element.leadingAnchor
        self.secondAnchor = element.trailingAnchor
    }
    
    override public func constraints(_ first: AnchoraRelation<AnchoraXAxisAnchorRepresentable>, _ second: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> [NSLayoutConstraint] {
        
        return [self.firstAnchor!.constraint(first), self.secondAnchor!.constraint(second)]
    }
    public func constraints(_ object: AnchoraLeadTrailAnchorsRepresentable) -> [NSLayoutConstraint] {
        
        let constr1 = object.anchora().constraints.first
        let constr2 = object.anchora().constraints.second
        
        let one = self.firstAnchor!.constraint(constr1.relation, to: constr1.anchor!, multiplier: constr1.multiplier, constant: constr1.constant)
        let two = self.secondAnchor!.constraint(constr2.relation, to: constr2.anchor!, multiplier: constr2.multiplier, constant: constr2.constant)
        
        return [one, two]
    }
}

public class AnchoraVerticalAnchors: AnchoraAnchorPair<AnchoraYAxisAnchorRepresentable, AnchoraYAxisAnchorRepresentable, NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
    
    override init(_ element: UILayoutElement) {
        
        self.firstAnchor = element.topAnchor
        self.secondAnchor = element.bottomAnchor
    }
    
    override public func constraints(_ first: AnchoraRelation<AnchoraYAxisAnchorRepresentable>, _ second: AnchoraRelation<AnchoraYAxisAnchorRepresentable>) -> [NSLayoutConstraint] {
        
        return [self.firstAnchor!.constraint(first), self.secondAnchor!.constraint(second)]
    }
    public func constraints(_ object: AnchoraVerticalAnchorsRepresentable) -> [NSLayoutConstraint] {
        
        let constr1 = object.anchora().constraints.first
        let constr2 = object.anchora().constraints.second
        
        let one = self.firstAnchor!.constraint(constr1.relation, to: constr1.anchor!, multiplier: constr1.multiplier, constant: constr1.constant)
        let two = self.secondAnchor!.constraint(constr2.relation, to: constr2.anchor!, multiplier: constr2.multiplier, constant: constr2.constant)
        
        return [one, two]
    }
}
