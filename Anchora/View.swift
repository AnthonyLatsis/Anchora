//
//  View.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit


class View: UIView {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension View {
    
    func setup() {
        
        
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 3.0, constant: 50).isActive = true
        
        self.heightAnchor.constraint(self.widthAnchor * 3 + 50).isActive = true
        
        self.heightAnchor.equals(self.widthAnchor * 3 + 50)
        
       // self.center(x: self.centerXAnchor * 0.34, y: self.centerYAnchor * 0.56)
        
        self.label.anchor(to: self, insets: (0, 0, 0, 9))

        //self.label.anchor(to: self, top: 5, left: 7, right: 8, bottom: 6)
        self.topAnchor.constraint(self.bottomAnchor * 4 + 5).isActive = true
        
        self.topAnchor.constraint(.lessOrEquals(self.topAnchor - 40)).isActive = true
        self.topAnchor.constraint(.greaterOrEquals(self.bottomAnchor)).isActive = true
        
        self.topAnchor.lessOrEquals(label.bottomAnchor * 6 - 500)
        
        
//        self.anchor(top: self.bottomAnchor * 5, left: self.leftAnchor - 6, right: label.leftAnchor * 7 - 5)
        
        self.heightAnchor.equals(self.widthAnchor * 5 - 100)
        
        self.heightAnchor.constraint(.lessOrEquals(self.widthAnchor - 5)).isActive = true
        
        self.heightAnchor.constraint(.lessOrEquals(self.heightAnchor)).isActive = true//(.lessOrEquals(50)).isActive = true
        
        self.heightAnchor.constraint(.lessOrEquals(40)).isActive = true
        
        self.bottomAnchor.constraint(.lessOrEquals(label.bottomAnchor * 4 - 8)).isActive = true
        // self.topAnchor.constraint(.equals(self.bottomAnchor * 2 - Style.bezel)).isActive = true
        // self.topAnchor.constraint(self.bottomAnchor * 2 - Style.bezel).isActive = true
        //
    }
}
