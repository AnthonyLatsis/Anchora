//
//  AnchoraContext.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

public typealias PartialConstraintPair<T, U> = (first: AnchoraPartialConstraint<T>, second: AnchoraPartialConstraint<U>)

public typealias PartialConstraintQuartet<T, U, R, S> = (first: AnchoraPartialConstraint<T>, second: AnchoraPartialConstraint<U>, third: AnchoraPartialConstraint<R>, fourth: AnchoraPartialConstraint<S>)



public class AnchoraContext<PartialConstraints> {
    
    internal let constraints: PartialConstraints

    internal init(constraints: PartialConstraints) {
        
        self.constraints = constraints
    }
}

public class AnchoraDimensionContext: AnchoraContext<AnchoraPartialConstraint<NSLayoutDimension>>, AnchoraDimensionRepresentable {
    
    public func anchora() -> AnchoraContext<AnchoraPartialConstraint<NSLayoutDimension>> {
        
        return self
    }
}


public class AnchoraXAxisAnchorContext: AnchoraContext<AnchoraPartialConstraint<NSLayoutXAxisAnchor>>, AnchoraXAxisAnchorRepresentable {
    
    public func anchora() -> AnchoraContext<AnchoraPartialConstraint<NSLayoutXAxisAnchor>> {
        
        return self
    }
}

public class AnchoraYAxisAnchorContext: AnchoraContext<AnchoraPartialConstraint<NSLayoutYAxisAnchor>>, AnchoraYAxisAnchorRepresentable {
    
    public func anchora() -> AnchoraContext<AnchoraPartialConstraint<NSLayoutYAxisAnchor>> {
        
        return self
    }
}

public class AnchoraSizeAnchorsContext: AnchoraContext<PartialConstraintPair<NSLayoutDimension, NSLayoutDimension>>, AnchoraSizeAnchorsRepresentable {
    
    public func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutDimension, NSLayoutDimension>> {
        
        return self
    }
}

public class AnchoraCenterAnchorsContext: AnchoraContext<PartialConstraintPair<NSLayoutXAxisAnchor, NSLayoutYAxisAnchor>>, AnchoraCenterAnchorsRepresentable {
    
    public func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutXAxisAnchor, NSLayoutYAxisAnchor>> {
        
        return self
    }
}

public class AnchoraLeftRightAnchorsContext: AnchoraContext<PartialConstraintPair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>>, AnchoraLeftRightAnchorsRepresentable {
    
    public func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>> {
        
        return self
    }
}


public class AnchoraLeadTrailAnchorsContext: AnchoraContext<PartialConstraintPair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>>, AnchoraLeadTrailAnchorsRepresentable {
    
    public func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>> {
        
        return self
    }
}

public class AnchoraVerticalAnchorsContext: AnchoraContext<PartialConstraintPair<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor>>, AnchoraVerticalAnchorsRepresentable {
    
    public func anchora() -> AnchoraContext<PartialConstraintPair<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor>> {
        
        return self
    }
}

public class AnchoraEdgeAnchorsContext: AnchoraContext<PartialConstraintQuartet<NSLayoutYAxisAnchor, NSLayoutXAxisAnchor, NSLayoutYAxisAnchor, NSLayoutXAxisAnchor>>, AnchoraEdgeAnchorsRepresentable {
    
    public func anchora() -> AnchoraContext<PartialConstraintQuartet<NSLayoutYAxisAnchor, NSLayoutXAxisAnchor, NSLayoutYAxisAnchor, NSLayoutXAxisAnchor>> {
        
        return self
    }
}





