//
//  SearchViewController.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: SearchPresenter?
    var dataSource: TableViewDataSource!
    private var retry: RetryView?
    
    init(_ presenter: SearchPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.set(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        searchBarConfig()
        tableViewConfig()
        presenter?.present()
    }
    
}

extension SearchViewController {
    
    func config(){
        self.navigationItem.title = "Tracks".localized
        self.hideKeyboardWhenTap()
        let signOut = UIBarButtonItem(image: UIImage(named: "baseline_exit_to_app_black_24pt"), style: .done, target: self, action: #selector(signOutAction))
        self.navigationItem.rightBarButtonItem = signOut
    }
    
    @objc func signOutAction(){
        let alert = UIAlertController(title: "SignOut".localized, message: "", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "OK".localized, style: .destructive) { _ in
            self.presenter?.didSignOut()
        }
        
        alert.addAction(yesAction)
        alert.addAction(UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableViewConfig() {
        self.dataSource = TableViewDataSource(delegate: self)
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100.0
        self.tableView.allowsSelection = true
        self.tableView.tableFooterView = UIView()
        self.tableView.sectionHeaderHeight = 0.0
        self.tableView.sectionFooterHeight = 0.0
        self.tableView.register(TrackTableViewCell.self)
        let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicatorView.color = #colorLiteral(red: 0.4588235021, green: 0.4588235021, blue: 0.4588235021, alpha: 1)
        activityIndicatorView.startAnimating()
        activityIndicatorView.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(100))
        self.tableView.tableFooterView = activityIndicatorView
        self.tableView.tableFooterView?.isHidden = true
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.presenter?.didSearch(text: searchBar.text ?? "")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.presenter?.didSearch(text: "")
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.presenter?.didSearch(text: "")
    }
    
    func searchBarConfig(){
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.delegate = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "SearchBarPlaceholder".localized
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}

extension SearchViewController: SearchPresentingView, TableViewDataSourceDelegate {
    
    func didEndTableViewItems() {
        self.presenter?.didEndSearchViewModel()
    }
    
    func didUpdate(search viewModel: TableViewModel) {
        self.dataSource.viewModel = viewModel
        self.tableView.reloadData()
    }
    
    func willLoadingData() {
        self.retry?.removeFromSuperview()
        self.tableView.tableFooterView?.isHidden = false
    }
    
    func didLoadingData() {
        self.tableView.tableFooterView?.isHidden = true
    }
    
    func warning(message: String) {
        self.retry?.removeFromSuperview()
        retry = .fromNib()
        retry?.message = message
        retry?.retryTaped = { [weak self]  in self?.presenter?.didRetry() }
        self.showRetry(view: retry!)
    }
    
}
