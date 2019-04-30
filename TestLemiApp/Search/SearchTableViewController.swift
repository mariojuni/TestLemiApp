//
//  CityTableViewController.swift
//  TestLemiApp
//
//  Created by Mario Juni on 22/04/2019.
//  Copyright © 2019 VeritasPay Inc. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

protocol  ChildViewController {
    func getLocation(loc : String)
}


class SearchTableViewController: UITableViewController {

    lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect.zero)
    var viewModel  = SearchViewModel()
    var delegate : ChildViewController?
    var strLocation = ""
    lazy var sb  = UIStoryboard(name: "Main", bundle: nil)
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = searchBar
        searchBar.placeholder = "Search City"
        searchBar.sizeToFit()
        tableView.dataSource = nil
        tableView.delegate = nil
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        bindViewModel()
   
    }
   
    func bindViewModel()  {
        let input = SearchViewModel.Input(searchText: searchBar.rx.text.orEmpty.asDriver())
        let output = viewModel.transform(input: input)
        
        output.loading.drive(UIApplication.shared.rx.isNetworkActivityIndicatorVisible).disposed(by: disposeBag)
        output.results.drive(tableView.rx.items(cellIdentifier: String(describing: SearchCell.self),  cellType: SearchCell.self)){ (row ,element ,cell) in
                cell.configure(data: element)
        }.disposed(by: disposeBag)

        tableView.rx.modelSelected(City.self).subscribe {  city in
            self.delegate!.getLocation(loc: "You selected :  \(String(describing: city.element!.name!))")
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
    }


}

