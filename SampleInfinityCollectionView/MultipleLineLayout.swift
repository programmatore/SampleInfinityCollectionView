//
//  MulpleLineLayout.swift
//  SampleInfinityCollectionView
//
//  Created by nagisa-kosuge on 2015/05/19.
//  Copyright (c) 2015年 RyoKosuge. All rights reserved.
//

import UIKit

class MultipleLineLayout: UICollectionViewFlowLayout {
    
    var itemHeight: Int
    var itemWidth: Int
    var space: Int
    
    init(itemHeight:Int, itemWidth: Int, space: Int) {
        
        self.itemHeight = itemHeight
        self.itemWidth = itemWidth
        self.space = space
        
        super.init()
        scrollDirection = .horizontal
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var collectionViewContentSize : CGSize {
        if let collectionView = collectionView {
            let xSize = collectionView.numberOfItems(inSection: 0) * (itemWidth + space)
            let ySize = collectionView.numberOfSections * (itemHeight + space)
            return CGSize(width: xSize, height: ySize)
        }
        return CGSize.zero
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.size = CGSize(width: itemWidth, height: itemHeight)
        let xValue = itemWidth / 2 + indexPath.row * (itemWidth + space)
        let yValue = itemHeight + indexPath.section * (itemHeight + space)
        attributes.center = CGPoint(x: xValue, y: yValue)
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes: [UICollectionViewLayoutAttributes] = []
        let minRow: Int = (rect.origin.x > 0.0) ? (Int(rect.origin.x) / Int(itemWidth + space)) : 0
        let maxRow: Int = Int(rect.size.width) / (itemWidth + space) + minRow
        let sectionNum: Int = collectionView?.numberOfSections ?? 0
        for i in 0...(sectionNum - 1) {
            for j in minRow...maxRow {
                let indexPath = IndexPath(item: j, section: i)
                let attribute = layoutAttributesForItem(at: indexPath)
                attributes.append(attribute!)
            }
        }
        
        return attributes
    }
    
}
