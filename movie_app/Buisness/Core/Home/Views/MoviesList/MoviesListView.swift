//
//  MoviesListView.swift
//  movie_app
//
//  Created by Esraa on 10/08/2022.
//  Copyright © 2022 Esraa Masuad. All rights reserved.
//

import UIKit

class MoviesListView: BaseView<MoviesListVM, BaseItem> {
    
    let productCellIdintifier = String(describing: MovieCollectionViewCell.self)
    private let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var sortLbl: UILabel!
    @IBOutlet weak var moviesCollectionView: UICollectionView!{
        didSet{
            self.moviesCollectionView.registerCell(idintifier: productCellIdintifier)
        }
    }
    
    override func bindind() {
        setTransparentNavagtionBar("")
        viewModel = MoviesListVM(routingManeger: RouterManagerImpl(self))
        viewModel.sorting.bind(to: sortLbl)
        viewModel.moviesList.bind { (list) in
            self.refreshControl.endRefreshing()
            self.moviesCollectionView.removeNoDataPlaceholder()
            if list.count == 0 {
                self.moviesCollectionView.setNoDataPlaceholder()
            }
            self.moviesCollectionView.reloadData()
        }
        
        initRefreshController() //add pull to refresh
        viewModel.reloadData()
    }
    
    func initRefreshController() {
        if #available(iOS 10.0, *) {
            moviesCollectionView.refreshControl = refreshControl
        } else {
            moviesCollectionView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(pullToRefresh(_:)), for: .valueChanged)
    }
    
    @objc private func pullToRefresh(_ sender: Any) {
        viewModel.pullToRefresh.value = true
        viewModel.reloadData()
    }
}

//MARK:- Actions -
extension MoviesListView{
    @IBAction func sortAction(_ button: UIButton){
        viewModel.routeToSortPopup()
    }
}

//MARK:- Colection Delegate -
extension MoviesListView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.moviesList.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellIdintifier, for: indexPath) as! MovieCollectionViewCell
        let item = viewModel.moviesList.value[indexPath.row]
        cell.configure(item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.routeToProductDetails(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (collectionView.frame.width/2)-10
        return CGSize(width: w, height: w*2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

//MARK:- Menu long Pressed -
@available(iOS 13.0, *)
extension MoviesListView {
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        configureContextMenu(index: indexPath.row)
    }
    
    func configureContextMenu(index: Int) -> UIContextMenuConfiguration{
        let context = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (action) -> UIMenu? in
            let add = UIAction(title: "Add to list", image: UIImage(systemName: "list.dash"), identifier: nil, discoverabilityTitle: nil, state: .off) { (_) in
            }
            
            let favourite = UIAction(title: "Favourite", image: UIImage(systemName: "ic_favorite_border_white"), identifier: nil, discoverabilityTitle: nil, state: .off) { (_) in
            }
            let watchList = UIAction(title: "Watch List", image: UIImage(systemName: "bookmark.fill"), identifier: nil, discoverabilityTitle: nil, state: .off) { (_) in
            }
            
            let yourRating = UIAction(title: "Your Rating", image: UIImage(systemName: "cm_star_border_white"), identifier: nil, discoverabilityTitle: nil, state: .off) { (_) in
                
            }
            let list = [add, watchList, favourite, yourRating]
            return UIMenu(title: "", image: nil, identifier: nil, options: UIMenu.Options.displayInline, children: list)
        }
        return context
    }
}
