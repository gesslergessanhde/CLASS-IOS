//
//  ViewController.swift
//  colllectionviewdefualtdatasource
//
//  Created by LABORATORIO MAC UAM on 31/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    typealias DataSource = UICollectionViewDiffableDataSource <MenuType, MenuModel>
        typealias Snapshot = NSDiffableDataSourceSnapshot<MenuType, MenuModel>

    @IBOutlet weak var CollectionViewController: UICollectionView!
    
    private lazy var dataSource = makeDataSource()
    
    private var menuItems = [MenuModel]()
    
    
    let controller = MenuController(dataSource: MockMenuDataSource())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellRegistration()
        
        loadData()
      
    }
    
    func loadData(){
        
       menuItems = controller.getData()
        
        
    }
    private func applySnapshot(){
        
        var snapshot = Snapshot()
        
        snapshot.appendSections(MenuType.allCases)
        
        MenuType.allCases.forEach{ menuType in
            snapshot.appendItems(menuItems.filter{ $0.type == menuType}, toSection: menuType)
        }
        
        snapshot.appendItems(menuItems)
        
        dataSource.apply(snapshot, animatingDifferences: true)
        
        
    }
    
    
    
    func makeDataSource() -> DataSource{
        
        let dataSource = DataSource(collectionView: CollectionViewController) { CollectionViewController, indexPath, itemIdentifier in
            
            let cell = CollectionViewController.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as? MenuCollectionViewCell
            
            cell?.setup(menuModel: itemIdentifier)
            
            return cell
            
        }
        
        return dataSource
    }
    
    func cellRegistration(){
        
        CollectionViewController.register(UINib(nibName: "MenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MenuCollectionViewCell")
    }
    
    private func configureLayout(){
        
        CollectionViewController.collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(280))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(280))
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            section.interGroupSpacing = 20
            
            return section
            
            
            
        })
    }
    
}


