//
//  AnchoraAnchorQuartet.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/12/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import Foundation

public class AnchoraAnchorQuartet<AnchorType1: AnyObject, AnchorType2: AnyObject, AnchorType3: AnyObject, AnchorType4: AnyObject> {
    
    internal var anchor1: NSLayoutAnchor<AnchorType1>
    internal var anchor2: NSLayoutAnchor<AnchorType2>
    internal var anchor3: NSLayoutAnchor<AnchorType3>
    internal var anchor4: NSLayoutAnchor<AnchorType4>
    
    internal init(_ anchor1: NSLayoutAnchor<AnchorType1>, _ anchor2: NSLayoutAnchor<AnchorType2>, _ anchor3: NSLayoutAnchor<AnchorType3>, _ anchor4: NSLayoutAnchor<AnchorType4>) {
        
        self.anchor1 = anchor1
        self.anchor2 = anchor2
        self.anchor3 = anchor3
        self.anchor4 = anchor4
    }
    
    public func equal<T: AnchoraQuartetContextRepresentable>(_ object: T) where T.AnchorType1 == AnchorType1, T.AnchorType2 == AnchorType2, T.AnchorType3 == AnchorType3, T.AnchorType4 == AnchorType4 {
        
        self.constrain(object)
    }
    
    public func constrain<T: AnchoraQuartetContextRepresentable>(_ object: T) where T.AnchorType1 == AnchorType1, T.AnchorType2 == AnchorType2, T.AnchorType3 == AnchorType3, T.AnchorType4 == AnchorType4 {
        
        for c in self.constraints(object) { c.activate() }
    }
    
    public func constraints<T: AnchoraQuartetContextRepresentable>(_ object: T) -> [NSLayoutConstraint] where T.AnchorType1 == AnchorType1, T.AnchorType2 == AnchorType2, T.AnchorType3 == AnchorType3, T.AnchorType4 == AnchorType4 {
        
        let constr1 = object.context().constraints.first
        let constr2 = object.context().constraints.second
        let constr3 = object.context().constraints.third
        let constr4 = object.context().constraints.fourth
        
        let one = self.anchor1.constraint(constr1.relation, to: constr1.anchor!, multiplier: constr1.multiplier, constant: constr1.constant)
        let two = self.anchor2.constraint(constr2.relation, to: constr2.anchor!, multiplier: constr2.multiplier, constant: constr2.constant)
        let three = self.anchor3.constraint(constr3.relation, to: constr3.anchor!, multiplier: constr3.multiplier, constant: constr3.constant)
        let four = self.anchor4.constraint(constr4.relation, to: constr4.anchor!, multiplier: constr4.multiplier, constant: constr4.constant)
        
        return [one, two, three, four]
    }
    
    public func constraints<T: AnchoraSingleContextRepresentable, U: AnchoraSingleContextRepresentable, R: AnchoraSingleContextRepresentable, S: AnchoraSingleContextRepresentable>(_ first: T, _ second: U, _ third: R, _ fourth: S) -> [NSLayoutConstraint] where T.AnchorType == AnchorType1, U.AnchorType == AnchorType2, R.AnchorType == AnchorType3, S.AnchorType == AnchorType4 {
        
        let obj = AnchoraQuartetContext<T.AnchorType, U.AnchorType, R.AnchorType, S.AnchorType, T.RelationType>.init(constraints: (first.context().constraints, second.context().constraints, third.context().constraints, fourth.context().constraints))
        
        return self.constraints(obj)
    }
    
    public func constrain<T: AnchoraSingleContextRepresentable, U: AnchoraSingleContextRepresentable, R: AnchoraSingleContextRepresentable, S: AnchoraSingleContextRepresentable>(_ first: T, _ second: U, _ third: R, _ fourth: S) where T.AnchorType == AnchorType1, U.AnchorType == AnchorType2, R.AnchorType == AnchorType3, S.AnchorType == AnchorType4 {
        
        for c in self.constraints(first, second, third, fourth) { c.activate() }
    }
}

extension AnchoraAnchorQuartet: AnchoraQuartetContextRepresentable {
    
    public func context() -> AnchoraQuartetContext<AnchorType1, AnchorType2, AnchorType3, AnchorType4, LayoutDefaultRelation> {
        
        let constr1 = AnchoraConstraintContext.init(anchor: self.anchor1)
        let constr2 = AnchoraConstraintContext.init(anchor: self.anchor2)
        let constr3 = AnchoraConstraintContext.init(anchor: self.anchor3)
        let constr4 = AnchoraConstraintContext.init(anchor: self.anchor4)
        
        return AnchoraQuartetContext.init(constraints: (constr1, constr2, constr3, constr4))
    }
}

