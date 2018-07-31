//
//  FontsExampleViewController.swift
//  CollectionOfSystemFonts
//
//  Created by Yaroslav Skachkov on 14.07.2018.
//  Copyright © 2018 Yaroslav Skachkov. All rights reserved.
//

import UIKit

class FontsExampleViewController: UIViewController {
    
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var heightOfExampleLabel: UILabel!
    
    var fontExample: Font?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        familyLabel.text = fontExample?.title
        weightLabel.text = fontExample?.description
        exampleLabel.textColor = .green
        if let weight = fontExample?.description {
            exampleLabel.font = UIFont(name: weight, size: UIFont.systemFontSize)
        }
        heightOfExampleLabel.text = String(Float(exampleLabel.font.pointSize))
    }
}
