//
//  DesignClass.swift
//  Ginger
//
//  Created by Ahmet Ekti on 5.06.2020.
//  Copyright © 2020 freelancer.istanbul.ginger. All rights reserved.
//

import UIKit

// MARK: V0.0.1 Eklendi

@IBDesignable
open class view_desing: UIView {
    
    func setup() {
        layer.cornerRadius = 12
        backgroundColor = Color._FFFFFF
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

}
open class view2_desing: UIView {
    
    func setup() {
        layer.cornerRadius = 12
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

}
@IBDesignable
open class button_desing: UIButton {
    
    func setup() {
        
        layer.cornerRadius = 12
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

}
@IBDesignable
open class label_desing: UILabel {
    
    
    
        
    func setup() {
    
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

}


@IBDesignable class BottomAlignedLabel: UILabel {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawText(in rect: CGRect) {
        
        guard text != nil else {
            return super.drawText(in: rect)
        }
        
        let height = self.sizeThatFits(rect.size).height
        let y = rect.origin.y + rect.height - height
        super.drawText(in: CGRect(x: 0, y: y, width: rect.width, height: height))
    }
}

// MARK: V0.0.3 EKLENDİ
@IBDesignable class TopAlignedLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawText(in rect: CGRect) {
        
        guard text != nil else {
            return super.drawText(in: rect)
        }
        
        let height = self.sizeThatFits(rect.size).height
        let y = rect.origin.y
        super.drawText(in: CGRect(x: 0, y: y, width: rect.width, height: height))
    }
}


