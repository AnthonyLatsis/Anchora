//
//  AnchoraSizeAnchors.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/9/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

// Abstract Anchora and AnchoraRelation is only done through global relation methods rn


class View: UIView {
    
    func setup() {
        
        self.constraints.size(self.sizeAnchors * (<=3, 4) - (5, 0))
        
        self.constraints.size(self.widthAnchor * 3 - 5, self.heightAnchor * 4)
        
        self.heightAnchor.constraint(.lessOrEquals(self.widthAnchor * 5 - 8)).isActive = true
        
//        self.heightAnchor.constraint(<=(self.widthAnchor * 5 - 8))

//        self.heightAnchor.constraint(.lessOrEquals(self.widthAnchor * 5 - 8))
        

//        self.constraints.edges(self.edges * (<=4, <=5, <=8, <=9) - (4, 5, 6, 7))
 
//        self.constraints.edges((.lessOrEquals(4), <=5, <=8, <=9) * self.edges - (4, 5, 6, 7))
        
//        self.constraints.edges(self.edges - (<=4, 5, <=6, 7))
        
//                      =============<><><><><><>=============
// self.constraints.edges(.
//        self.constraints.edges(self.edges, <=(*3 - 4), <=(*5 - 5), <=(*8 - 6), <=(*9 - 7))
        
        self.centerAnchors.constraints(self.centerXAnchor * 4, self.centerYAnchor - 5)
        //self.heightAnchor.constraint(CGFloat(6)).isActive = true
        self.constraint.bottom(self.topAnchor * 4)
        //self.constraints(.height == 50, .width <= 30, .top == label.bottomAnchor - 8))

        self.constraints.height(50).width(<=30).top(self.bottomAnchor - 8)
        
        let n = Set<Int>.init()
        let t = n.map({$0})
        
        let m = Slice<IndexPath>.init(base: IndexPath(), bounds: Range<Int>.init(0...3))
        
        let m = Collection
   }
}








