//
//  SearchViewModel.swift
//  TestLemiApp
//
//  Created by Mario Juni on 22/04/2019.
//  Copyright © 2019 VeritasPay Inc. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire

final class SearchViewModel : ViewModelType{
    
    struct Input {
        let searchText: Driver<String>
    }
    struct Output {
        let results : Driver<[City]>
        let loading : Driver<Bool>
    }
    
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let loading = activityIndicator.asDriver()
        let errorTracker = ErrorTracker()
        
        let query = input.searchText
            .asObservable()
            .filter { $0.count >= 0 }
            .throttle(0.5, scheduler: MainScheduler.instance)
        
    
        let results = query.flatMapLatest {  query -> Driver<[City]?> in
            return APIClient.instance.fetchCity(query: query)
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
                    .asDriver(onErrorJustReturn: [])
        }
        let mappedResults = results.filter { $0 != nil }.map { $0! }.asDriverOnErrorJustComplete()
        
        return Output(results: mappedResults,
                      loading: loading)
    }
    
}
struct SearchResultItemViewModel {
    let title: String
    let subtitle: String
    let imageUrl: String?
}
extension SearchResultItemViewModel {
    init(searchResultItem: City) {
        self.title = searchResultItem.name ?? ""
        self.subtitle = searchResultItem.subtitle ?? ""
        self.imageUrl = searchResultItem.banner
    }
}
