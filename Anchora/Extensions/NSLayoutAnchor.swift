//
//  NSLayoutAnchor.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/13/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

internal extension NSLayoutAnchor {

    @objc internal func constraint(_ relation: NSLayoutRelation = .equal, to anchor: NSLayoutAnchor<AnchorType>, multiplier m: CGFloat = 1.0, constant c: CGFloat = 0.0) -> NSLayoutConstraint {

        switch relation {
        case .equal:
            return self.constraint(equalTo: anchor, constant: c).with(m: m)
        case .lessThanOrEqual:
            return self.constraint(lessThanOrEqualTo: anchor, constant: c).with(m: m)
        case .greaterThanOrEqual:
            return self.constraint(greaterThanOrEqualTo: anchor, constant: c).with(m: m)
        }
    }
}

