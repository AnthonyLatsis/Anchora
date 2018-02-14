//
//  AnchoraAnchorQuartet.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/12/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import Foundation

public class AnchoraAnchorQuartet<AnchoraRepresentable1, AnchoraRepresentable2, AnchoraRepresentable3, AnchoraRepresentable4, AnchorType1, AnchorType2, AnchorType3, AnchorType4> {
    
    internal var anchor1: AnchorType1? = nil
    internal var anchor2: AnchorType2? = nil
    internal var anchor3: AnchorType3? = nil
    internal var anchor4: AnchorType4? = nil
    
    internal init(_ element: UILayoutElement) {}
    
    public func constraints(_ first: AnchoraRepresentable1, _ second: AnchoraRepresentable2, _ third: AnchoraRepresentable3, _ fourth: AnchoraRepresentable4) -> [NSLayoutConstraint] {
        
        return self.constraints(.equals(first), .equals(second), .equals(third), .equals(fourth))
    }
    public func constraints(_ first: AnchoraRelation<AnchoraRepresentable1>, _ second: AnchoraRepresentable2, _ third: AnchoraRepresentable3, _ fourth: AnchoraRepresentable4) -> [NSLayoutConstraint] {
        
        return self.constraints(first, .equals(second), .equals(third), .equals(fourth))
    }
    public func constraints(_ first: AnchoraRepresentable1, _ second: AnchoraRelation<AnchoraRepresentable2>, _ third: AnchoraRepresentable3, _ fourth: AnchoraRepresentable4) -> [NSLayoutConstraint] {
        
        return self.constraints(.equals(first), second, .equals(third), .equals(fourth))
    }
    public func constraints(_ first: AnchoraRepresentable1, _ second: AnchoraRepresentable2, _ third: AnchoraRelation<AnchoraRepresentable3>, _ fourth: AnchoraRepresentable4) -> [NSLayoutConstraint] {
        
        return self.constraints(.equals(first), .equals(second), third, .equals(fourth))
    }
    public func constraints(_ first: AnchoraRepresentable1, _ second: AnchoraRepresentable2, _ third: AnchoraRepresentable3, _ fourth: AnchoraRelation<AnchoraRepresentable4>) -> [NSLayoutConstraint] {
        
        return self.constraints(.equals(first), .equals(second), .equals(third), fourth)
    }
    public func constraints(_ first: AnchoraRelation<AnchoraRepresentable1>, _ second: AnchoraRelation<AnchoraRepresentable2>, _ third: AnchoraRepresentable3, _ fourth: AnchoraRepresentable4) -> [NSLayoutConstraint] {
        
        return self.constraints(first, second, .equals(third), .equals(fourth))
    }
    public func constraints(_ first: AnchoraRepresentable1, _ second: AnchoraRelation<AnchoraRepresentable2>, _ third: AnchoraRelation<AnchoraRepresentable3>, _ fourth: AnchoraRepresentable4) -> [NSLayoutConstraint] {
        
        return self.constraints(.equals(first), second, third, .equals(fourth))
    }
    public func constraints(_ first: AnchoraRepresentable1, _ second: AnchoraRepresentable2, third: AnchoraRelation<AnchoraRepresentable3>, _ fourth: AnchoraRelation<AnchoraRepresentable4>) -> [NSLayoutConstraint] {
        
        return self.constraints(.equals(first), .equals(second), third, fourth)
    }
    public func constraints(_ first: AnchoraRelation<AnchoraRepresentable1>, _ second: AnchoraRepresentable2, _ third: AnchoraRepresentable3, _ fourth: AnchoraRelation<AnchoraRepresentable4>) -> [NSLayoutConstraint] {
        
        return self.constraints(first, .equals(second), .equals(third), fourth)
    }
    public func constraints(_ first: AnchoraRepresentable1, _ second: AnchoraRelation<AnchoraRepresentable2>, _ third: AnchoraRepresentable3, _ fourth: AnchoraRelation<AnchoraRepresentable4>) -> [NSLayoutConstraint] {
        
        return self.constraints(.equals(first), second, .equals(third), fourth)
    }
    public func constraints(_ first: AnchoraRelation<AnchoraRepresentable1>, _ second: AnchoraRepresentable2, _ third: AnchoraRelation<AnchoraRepresentable3>, _ fourth: AnchoraRepresentable4) -> [NSLayoutConstraint] {
        
        return self.constraints(first, .equals(second), third, .equals(fourth))
    }
    public func constraints(_ first: AnchoraRelation<AnchoraRepresentable1>, _ second: AnchoraRelation<AnchoraRepresentable2>, _ third: AnchoraRelation<AnchoraRepresentable3>, _ fourth: AnchoraRepresentable4) -> [NSLayoutConstraint] {
        
        return self.constraints(first, second, third, .equals(fourth))
    }
    public func constraints(_ first: AnchoraRepresentable1, _ second: AnchoraRelation<AnchoraRepresentable2>, _ third: AnchoraRelation<AnchoraRepresentable3>, _ fourth: AnchoraRelation<AnchoraRepresentable4>) -> [NSLayoutConstraint] {
        
        return self.constraints(.equals(first), second, third, fourth)
    }
    public func constraints(_ first: AnchoraRelation<AnchoraRepresentable1>, _ second: AnchoraRepresentable2, _ third: AnchoraRelation<AnchoraRepresentable3>, _ fourth: AnchoraRelation<AnchoraRepresentable4>) -> [NSLayoutConstraint] {
        
        return self.constraints(first, .equals(second), third, fourth)
    }
    public func constraints(_ first: AnchoraRelation<AnchoraRepresentable1>, _ second: AnchoraRelation<AnchoraRepresentable2>, _ third: AnchoraRepresentable3, _ fourth: AnchoraRelation<AnchoraRepresentable4>) -> [NSLayoutConstraint] {
        
        return self.constraints(first, second, .equals(third), fourth)
    }
    public func constraints(_ first: AnchoraRelation<AnchoraRepresentable1>, _ second: AnchoraRelation<AnchoraRepresentable2>, _ third: AnchoraRelation<AnchoraRepresentable3>, _ fourth: AnchoraRelation<AnchoraRepresentable4>) -> [NSLayoutConstraint] {
        
        return []
    }
}

public class AnchoraEdgeAnchors: AnchoraAnchorQuartet<AnchoraYAxisAnchorRepresentable, AnchoraXAxisAnchorRepresentable, AnchoraYAxisAnchorRepresentable, AnchoraXAxisAnchorRepresentable, NSLayoutYAxisAnchor, NSLayoutXAxisAnchor, NSLayoutYAxisAnchor, NSLayoutXAxisAnchor> {
    
    override init(_ element: UILayoutElement) {
        
        self.anchor1 = element.topAnchor
        self.anchor2 = element.leftAnchor
        self.anchor3 = element.bottomAnchor
        self.anchor4 = element.rightAnchor
    }
    
    override public func constraints(_ first: AnchoraRelation<AnchoraYAxisAnchorRepresentable>, _ second: AnchoraRelation<AnchoraXAxisAnchorRepresentable>, _ third: AnchoraRelation<AnchoraYAxisAnchorRepresentable>, _ fourth: AnchoraRelation<AnchoraXAxisAnchorRepresentable>) -> [NSLayoutConstraint] {
        
        return [self.anchor1!.constraint(first),
                self.anchor2!.constraint(second),
                self.anchor3!.constraint(third),
                self.anchor4!.constraint(fourth)
        ]
    }
    public func constraints(_ object: AnchoraEdgeAnchorsRepresentable) -> [NSLayoutConstraint] {
        
        let constr1 = object.anchora().constraints.first
        let constr2 = object.anchora().constraints.second
        let constr3 = object.anchora().constraints.third
        let constr4 = object.anchora().constraints.fourth
        
        let one = self.anchor1!.constraint(constr1.relation, to: constr1.anchor!, multiplier: constr1.multiplier, constant: constr1.constant)
        let two = self.anchor2!.constraint(constr2.relation, to: constr2.anchor!, multiplier: constr2.multiplier, constant: constr2.constant)
        let three = self.anchor3!.constraint(constr3.relation, to: constr3.anchor!, multiplier: constr3.multiplier, constant: constr3.constant)
        let four = self.anchor4!.constraint(constr4.relation, to: constr4.anchor!, multiplier: constr4.multiplier, constant: constr4.constant)
        
        return [one, two, three, four]
    }
}
