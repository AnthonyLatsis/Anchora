//
//  AnchoraRelation.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/9/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

public enum AnchoraRelation<Object: Any> {
    
    case equals(Object)
    
    case lessOrEquals(Object)
    
    case greaterOrEquals(Object)
}

