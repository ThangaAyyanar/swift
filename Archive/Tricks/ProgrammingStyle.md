## Programming styles

```
how to write the program so that you can easily debug it easily if any problem occured

Template:
=========

import UIKit

class GridCollectionViewController: UIViewController {
    
    //MARK: Private Properties
    
    private var gridCollectionView:UICollectionView!
    
    //MARK: UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Sample Collection View grid"
        
        let layout = GridCOllectionViewLayout()
        
        gridCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        gridCollectionView.translatesAutoresizingMaskIntoConstraints = false
        gridCollectionView.delegate = self
        gridCollectionView.dataSource = self
        gridCollectionView.backgroundColor = .cyan
        gridCollectionView.register(GridCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        self.view.addSubview(gridCollectionView)
        
        addConstraints()
    }
    
    //MARK: Private Methods
    
    private func addConstraints(){
        NSLayoutConstraint(item: gridCollectionView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: gridCollectionView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: gridCollectionView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: gridCollectionView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
    }
    
}

//MARK: GridCollectinViewController delegate Functions

extension GridCollectionViewController: UICollectionViewDelegate {
    
}

//MARK: GridCollectinViewController datasource Functions

extension GridCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gridCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? GridCollectionViewCell
        cell?.label.text = "sec-\(indexPath.section) Row-\(indexPath.row)"
        cell?.backgroundColor = .cyan
        return cell!
    }
    
}

```

Reference: http://blog.jaredsinclair.com/post/152672541355/how-i-organize-a-swift-file
