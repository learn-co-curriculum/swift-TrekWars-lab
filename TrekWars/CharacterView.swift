//
//  CharacterView.swift
//  TrekWars
//
//  Created by James Campagno on 10/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class CharacterView: UIView {

    // If someone init's an instance of CharacterView programtically
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    // If someone init's an instance of CharacterView in Interface Builder.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CharacterView", owner: self, options: nil)
        
        
        
    }

}
