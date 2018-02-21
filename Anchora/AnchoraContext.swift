//
//  AnchoraContext.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit


fileprivate typealias ConstraintContextPair<T, U> = (first: AnchoraConstraintContext<T>, second: AnchoraConstraintContext<U>)

fileprivate typealias ConstraintContextQuartet<T, U, R, S> = (first: AnchoraConstraintContext<T>, second: AnchoraConstraintContext<U>, third: AnchoraConstraintContext<R>, fourth: AnchoraConstraintContext<S>)


internal class AnchoraContext<T> {
    
    internal let constraints: T

    internal init(constraints: T) {

        self.constraints = constraints
    }
}

public class AnchoraSingleContext<T, X: RelationRepresentable>: AnchoraContext<AnchoraConstraintContext<T>>, AnchoraSingleContextRepresentable {
    
    public func context() -> AnchoraSingleContext<T, X> {
        
        return self
    }
}

public class AnchoraPairContext<T, U, X: RelationRepresentable>: AnchoraContext<ConstraintContextPair<T, U>>, AnchoraPairContextRepresentable {
    
    public func context() -> AnchoraPairContext<T, U, X> {
        
        return self
    }
}

public class AnchoraQuartetContext<T, U, R, S, X: RelationRepresentable>: AnchoraContext<ConstraintContextQuartet<T, U, R, S>>, AnchoraQuartetContextRepresentable {
    
    public func context() -> AnchoraQuartetContext<T, U, R, S, X> {
        
        return self
    }
}
