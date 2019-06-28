//
//  ViewController.swift
//  CollectionViewText
//
//  Created by 藤田えりか on 2019/06/21.
//  Copyright © 2019 com.erica. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{
    
    var dog1 = [["name" : "あ",
                 "imageName" : "saku"],
                ["name" : "い",
                 "imageName" : "saku2"],
                ["name" : "う",
                 "imageName" : "saku3"]]
    var dog2 = [["name" : "え",
                 "imageName" : "lucky"],
                ["name" : "お",
                 "imageName" : "lucky2"]]
    var dogs = [["name" : "か",
                 "imageName" : "sl"],
                ["name" : "き",
                 "imageName" : "sl3"],
                ["name" : "く",
                 "imageName" : "sl4"]]
    
    @IBOutlet var collectionView: UICollectionView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch(section){
        case 0:
            return 3
            
        case 1:
            return 2
            
        case 2:
            return 3
            
        default:
            print("error")
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Section", for: indexPath)
        
        headerView.backgroundColor = UIColor.lightGray
        return headerView
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        
        switch(indexPath.section){
        case 0:
            cell.textLabel.textColor = UIColor.red
            cell.textLabel?.text = dog1[indexPath.row]["name"]
            cell.imageView.image = UIImage(named: dog1[indexPath.row]["imageName"]!)
            
        case 1:
            cell.textLabel.textColor = UIColor.orange
            cell.textLabel?.text = dog2[indexPath.row]["name"]
            cell.imageView.image = UIImage(named: dog2[indexPath.row]["imageName"]!)
            
        case 2:
            cell.textLabel.textColor = UIColor.blue
            cell.textLabel?.text = dogs[indexPath.row]["name"]
            cell.imageView.image = UIImage(named: dogs[indexPath.row]["imageName"]!)
            
        default:
            print("section error")
            cell.textLabel.textColor = UIColor.red
        }
        
        
        return cell
    }
    
    
}

