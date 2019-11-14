//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Patrick Millet on 11/14/19.
//  Copyright © 2019 Patrick Millet. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        setTheme()
    }
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "addPhotoShowSegue":
            guard let detailVC = segue.destination as? PhotoDetailViewController else { return }
            detailVC.themeHelper = themeHelper
            detailVC.photoController = photoController
        case "editPhotoShowSegue":
            guard let detailVC = segue.destination as? PhotoDetailViewController, let cell = sender as? PhotosCollectionViewCell, let indexPath = self.collectionView.indexPath(for: cell) else { return }
            
            let photo = photoController.photos[indexPath.item]
            detailVC.themeHelper = themeHelper
            detailVC.photoController = photoController
            detailVC.photo = photo
        case "themeSelectionSegue":
            guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
            themeVC.themeHelper = themeHelper
        default:
            return
        }
    }
    
    
    // MARK: UICollectionViewDataSource
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.row]
        cell.photo = photo
        
        return cell
    }
    
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else {return}
        if themePreference == "Red" {
            view.backgroundColor = .red
        } else if themePreference == "Dark" {
            view.backgroundColor = .darkGray
        } else { view.backgroundColor = .none }
    }
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
