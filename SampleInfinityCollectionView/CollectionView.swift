//
//  DataCollectionView.swift
//  SampleInfinityCollectionView
//
//  Created by nagisa-kosuge on 2015/05/19.
//  Copyright (c) 2015年 RyoKosuge. All rights reserved.
//

import UIKit

class CollectionView: UICollectionView {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let currentOffset = contentOffset
        let contentWidth = contentSize.width
        let contentHeight = contentSize.height
        
        let centerOffsetX = (contentWidth - bounds.width) / 2.0
        let centerOffsetY = (contentHeight - bounds.height) / 2.0
        
        let distanceFromCenterX = fabsf(Float(currentOffset.x - centerOffsetX))
        let distanceFromCenterY = fabsf(Float(currentOffset.y - centerOffsetY))
        
        if distanceFromCenterX > Float(contentWidth / 5.0) {
            contentOffset = CGPoint(x: centerOffsetX, y: currentOffset.y)
        }
        
        if distanceFromCenterY > Float(contentHeight / 5.0) {
            contentOffset = CGPoint(x: currentOffset.x, y: centerOffsetY)
        }
    }
    
}
