//
//  ViewController.swift
//  SampleInfinityCollectionView
//
//  Created by nagisa-kosuge on 2015/05/19.
//  Copyright (c) 2015年 RyoKosuge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let cellData: [[String]] = [
        ["1", "2", "3", "4", "5", "6"],
        ["7", "8", "9", "10", "11", "12"],
        ["13", "14", "15", "16", "17", "18"],
        ["19", "20", "21", "22", "23", "24"]
    ]
    
    var itemHeight: Int = 60
    var itemWidth: Int = 60
    var space: Int = 10
    
    @IBOutlet weak var collectionView: CollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK : - setup

extension ViewController {
    
    fileprivate func setupCollectionView() {
        let multpleLayout = MultipleLineLayout(itemHeight: itemHeight, itemWidth: itemWidth, space: space)
        collectionView.collectionViewLayout = multpleLayout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
}

// MARK : - delegate

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indexPath.section = \(indexPath.section % 4) / indexPath.row = \(indexPath.row % 6)")
        //        println("indexPath.section = \(indexPath.section % 4) / indexPath.row = \(indexPath.row % 6)")
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.label.text = cellData[indexPath.section % 4][indexPath.row % 6]
        return cell
    }
    
}
