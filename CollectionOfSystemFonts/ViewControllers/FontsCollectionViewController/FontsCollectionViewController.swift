//
//  FontsCollectionViewController.swift
//  CollectionOfSystemFonts
//
//  Created by Yaroslav Skachkov on 14.07.2018.
//  Copyright © 2018 Yaroslav Skachkov. All rights reserved.
//

import UIKit

class FontsCollectionViewController: UIViewController {
    
    @IBOutlet weak var fontsCollectionView: UICollectionView!
    
    var fonts: [Font] = []
    var fontsFamily: [String] = []
    var fontsFamilyWeigts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        writeToCell()
        
        self.fontsCollectionView.delegate = self
        self.fontsCollectionView.dataSource = self
    }
    
    func writeToCell() {
        for family in UIFont.familyNames.sorted(by: <) {
            fontsFamily.append(family)
            for weight in UIFont.fontNames(forFamilyName: family) {
                let font = Font(title: family, description: weight)
                fonts.append(font)
            }
        }
    }
}

extension FontsCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fonts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let fontCell = fontsCollectionView.dequeueReusableCell(withReuseIdentifier: fontsCollectionCellIdentifier, for: indexPath) as! FontsCollectionCell
        
        let font = fonts[indexPath.row]
        fontCell.titleLabel.text = font.title
        fontCell.titleLabel.font = UIFont(name: font.description, size: 20)
        fontCell.descriptionLabel.text = font.description
        fontCell.layer.borderColor = UIColor.lightGray.cgColor
        fontCell.layer.borderWidth = 0.5
        
        return fontCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let fontsExampleVC = mainSB.instantiateViewController(withIdentifier: fontsExampleVCIdentifier) as! FontsExampleViewController
        fontsExampleVC.fontExample = fonts[indexPath.row]
        self.navigationController?.pushViewController(fontsExampleVC, animated: true)
    }
}

extension FontsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: fontsCollectionView.bounds.width / CGFloat(cellsPerRow), height: fontsCollectionView.bounds.height / CGFloat(cellsPerColumn))
        return size
    }
}
