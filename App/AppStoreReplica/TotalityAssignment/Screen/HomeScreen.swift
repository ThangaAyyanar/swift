//
//  HomeScreen.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 03/11/21.
//

import UIKit

class HomeScreen: UICollectionViewController {
    
    let cellIdentifier  = "cell"
    let transition      = PopAnimator()
    let numberOfCells   = 2
    let navigationTitle = "Play Store"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = navigationTitle
        self.collectionView.register(HomeScreenCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! HomeScreenCell
        let appModel = AppModel.getDummyModel()
        cell.setView(appModel: appModel)
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openDetailViewController()
    }
    
    func openDetailViewController() {
        
        let detailViewController = DetailScreen()
        detailViewController.transitioningDelegate = self
        detailViewController.modalPresentationStyle = .fullScreen
        present(detailViewController, animated: true, completion: nil)
    }
    
}

//MARK: - CollectionView Flow Layout implementation

extension HomeScreen: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 50, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}

//MARK: - Page transition implementation

extension HomeScreen: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard let selectedIndexPathItem = collectionView.indexPathsForSelectedItems?.first,
              let selectedCell = collectionView.cellForItem(at: selectedIndexPathItem),
              let selectedCellSuperview = selectedCell.superview
        else {
                  return nil
              }
        
        transition.originFrame = selectedCellSuperview.convert(selectedCell.frame, to: nil)
        transition.originFrame = CGRect(
          x: transition.originFrame.origin.x,
          y: transition.originFrame.origin.y,
          width: transition.originFrame.size.width,
          height: transition.originFrame.size.height
        )

        
        transition.presenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }
}
