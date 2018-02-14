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
    
    public func constraints(_ first: AnchoraRepresentable1, _ second: AnchoraRepresentable2) -> [NSLayoutConstraint] {
        
        return []
    }
}

public class AnchoraCenterAnchors: AnchoraAnchorPair<AnchoraXAxisAnchorRepresentable, AnchoraYAxisAnchorRepresentable, NSLayoutXAxisAnchor, NSLayoutYAxisAnchor>, AnchoraCenterAnchorsRepresentable {
    
    init(_ element: UILayoutElement) {
        
        super.init()
        self.firstAnchor = element.centerXAnchor
        self.secondAnchor = element.centerYAnchor
    }
    
    override public func constraints(_ first: AnchoraXAxisAnchorRepresentable, _ second: AnchoraYAxisAnchorRepresentable) -> [NSLayoutConstraint] {
        
        return [self.firstAnchor!.constraint(first), self.secondAnchor!.constraint(second)]
    }
    public func constraints(_ object: AnchoraCenterAnchorsRepresentable) -> [NSLayoutConstraint] {
        
        let constr1 = object.anchora().constraints.first
        let constr2 = object.anchora().constraints.second
        
        let one = self.firstAnchor!.constraint(constr1.relation, to: constr1.anchor!, multiplier: constr1.multiplier, constant: constr1.constant)
        let two = self.secondAnchor!.constraint(constr2.relation, to: constr2.anchor!, multiplier: constr2.multiplier, constant: constr2.constant)
        
        return [one, two]
    }
    
    public func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutXAxisAnchor, NSLayoutYAxisAnchor>> {
        
        let constr1 = AnchoraPartialConstraint.init(anchor: self.firstAnchor)
        let constr2 = AnchoraPartialConstraint.init(anchor: self.secondAnchor)
        
        return AnchoraContext.init(constraints: (constr1, constr2))
    }
}

public class AnchoraSizeAnchors: AnchoraAnchorPair<AnchoraDimensionRepresentable, AnchoraDimensionRepresentable, NSLayoutDimension, NSLayoutDimension>, AnchoraSizeAnchorsRepresentable {
    
     init(_ element: UILayoutElement) {
        
        super.init()
        self.firstAnchor = element.widthAnchor
        self.secondAnchor = element.heightAnchor
    }
    
    override public func constraints(_ first: AnchoraDimensionRepresentable, _ second: AnchoraDimensionRepresentable) -> [NSLayoutConstraint] {
        
        return [self.firstAnchor!.constraint(first), self.secondAnchor!.constraint(second)]
    }
    public func constraints(_ object: AnchoraSizeAnchorsRepresentable) -> [NSLayoutConstraint] {
        
        let constr1 = object.anchora().constraints.first
        let constr2 = object.anchora().constraints.second
        
        var one: NSLayoutConstraint {
        
            if let anchor = constr1.anchor {
                
                return self.firstAnchor!.constraint(constr1.relation, to: anchor, multiplier: constr1.multiplier, constant: constr1.constant)
            } else {
                return self.firstAnchor!.constraint(constr1.relation, constant: constr1.constant)
            }
        }
        var two: NSLayoutConstraint {
            
            if let anchor = constr2.anchor {
            
                return self.secondAnchor!.constraint(constr2.relation, to: anchor, multiplier: constr2.multiplier, constant: constr2.constant)
            } else {
                return self.secondAnchor!.constraint(constr2.relation, constant: constr2.constant)
            }
        }        
        return [one, two]
    }
    
    public func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutDimension, NSLayoutDimension>> {
        
        let constr1 = AnchoraPartialConstraint.init(anchor: self.firstAnchor)
        let constr2 = AnchoraPartialConstraint.init(anchor: self.secondAnchor)
        
        return AnchoraContext.init(constraints: (constr1, constr2))
    }
}

public class AnchoraLeftRightAnchors: AnchoraAnchorPair<AnchoraXAxisAnchorRepresentable, AnchoraXAxisAnchorRepresentable, NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>, AnchoraLeftRightAnchorsRepresentable {
    
    init(_ element: UILayoutElement) {
        
        super.init()
        self.firstAnchor = element.leftAnchor
        self.secondAnchor = element.rightAnchor
    }
    
    override public func constraints(_ first: AnchoraXAxisAnchorRepresentable, _ second: AnchoraXAxisAnchorRepresentable) -> [NSLayoutConstraint] {
        
        return [self.firstAnchor!.constraint(first), self.secondAnchor!.constraint(second)]
    }
    public func constraints(_ object: AnchoraLeftRightAnchorsRepresentable) -> [NSLayoutConstraint] {
        
        let constr1 = object.anchora().constraints.first
        let constr2 = object.anchora().constraints.second
        
        let one = self.firstAnchor!.constraint(constr1.relation, to: constr1.anchor!, multiplier: constr1.multiplier, constant: constr1.constant)
        let two = self.secondAnchor!.constraint(constr2.relation, to: constr2.anchor!, multiplier: constr2.multiplier, constant: constr2.constant)
        
        return [one, two]
    }
    
    public func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>> {
        
        let constr1 = AnchoraPartialConstraint.init(anchor: self.firstAnchor)
        let constr2 = AnchoraPartialConstraint.init(anchor: self.secondAnchor)
        
        return AnchoraContext.init(constraints: (constr1, constr2))
    }
}

public class AnchoraLeadTrailAnchors: AnchoraAnchorPair<AnchoraXAxisAnchorRepresentable, AnchoraXAxisAnchorRepresentable, NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>, AnchoraLeadTrailAnchorsRepresentable {
    
    init(_ element: UILayoutElement) {
        
        super.init()
        self.firstAnchor = element.leadingAnchor
        self.secondAnchor = element.trailingAnchor
    }
    
    override public func constraints(_ first: AnchoraXAxisAnchorRepresentable, _ second: AnchoraXAxisAnchorRepresentable) -> [NSLayoutConstraint] {
        
        return [self.firstAnchor!.constraint(first), self.secondAnchor!.constraint(second)]
    }
    public func constraints(_ object: AnchoraLeadTrailAnchorsRepresentable) -> [NSLayoutConstraint] {
        
        let constr1 = object.anchora().constraints.first
        let constr2 = object.anchora().constraints.second
        
        let one = self.firstAnchor!.constraint(constr1.relation, to: constr1.anchor!, multiplier: constr1.multiplier, constant: constr1.constant)
        let two = self.secondAnchor!.constraint(constr2.relation, to: constr2.anchor!, multiplier: constr2.multiplier, constant: constr2.constant)
        
        return [one, two]
    }
    
    public func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>> {
        
        let constr1 = AnchoraPartialConstraint.init(anchor: self.firstAnchor)
        let constr2 = AnchoraPartialConstraint.init(anchor: self.secondAnchor)
        
        return AnchoraContext.init(constraints: (constr1, constr2))
    }
}

public class AnchoraVerticalAnchors: AnchoraAnchorPair<AnchoraYAxisAnchorRepresentable, AnchoraYAxisAnchorRepresentable, NSLayoutYAxisAnchor, NSLayoutYAxisAnchor>, AnchoraVerticalAnchorsRepresentable {
    
    init(_ element: UILayoutElement) {
        
        super.init()
        self.firstAnchor = element.topAnchor
        self.secondAnchor = element.bottomAnchor
    }
    
    override public func constraints(_ first: AnchoraYAxisAnchorRepresentable, _ second: AnchoraYAxisAnchorRepresentable) -> [NSLayoutConstraint] {
        
        return [self.firstAnchor!.constraint(first), self.secondAnchor!.constraint(second)]
    }
    public func constraints(_ object: AnchoraVerticalAnchorsRepresentable) -> [NSLayoutConstraint] {
        
        let constr1 = object.anchora().constraints.first
        let constr2 = object.anchora().constraints.second
        
        let one = self.firstAnchor!.constraint(constr1.relation, to: constr1.anchor!, multiplier: constr1.multiplier, constant: constr1.constant)
        let two = self.secondAnchor!.constraint(constr2.relation, to: constr2.anchor!, multiplier: constr2.multiplier, constant: constr2.constant)
        
        return [one, two]
    }
    
    public func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor>> {
        
        let constr1 = AnchoraPartialConstraint.init(anchor: self.firstAnchor)
        let constr2 = AnchoraPartialConstraint.init(anchor: self.secondAnchor)
        
        return AnchoraContext.init(constraints: (constr1, constr2))
    }
}
