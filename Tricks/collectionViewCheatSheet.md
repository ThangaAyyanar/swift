## CollectionView
```
collection view consists of cells and main important to be noted in collection view is layout 

layout can be implemented using two ways
  [+] UICollectionViewFlowLayout
  [+] UICollectionViewLayout
 ```
 
 ### UICollectionViewFlowLayout
 ```
 The Layout which is very simple to implement
 the main problem with this layout is that we can scroll in any one direction at a time not simultaneously
 
 Inorder to create a collection view with UICollectionViewFlowLayout
 
 let layout = UICollectionViewFlowLayout()
 collectionView = UICollectionView(frame: size_of_collection_view,Layout: layout)

 ```

###UICollectionViewLayout
```
It is custom layout for collectionview

The size and position of the cell should be explicitly specified by us

To create a custom layout
we need to create a class which derived from UICollectionViewLayout
Override
  [+] Prepare method   --> where the initialization and calculation for the cells are done
  [+] layoutAttributesForItem --> where the cell attributes are returned based on the indexpath
  [+] layoutAttributesForSupplementaryView --> where the header attributes are returned based on the indexpath
```
