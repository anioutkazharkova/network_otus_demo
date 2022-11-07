//
//  NewsListModel.swift
//  iosApp
//
//  Created by Anna Zharkova on 03.10.2021.
//  Copyright © 2021 orgName. All rights reserved.
//

import Foundation
import SwiftUI

class NewsListModel : ObservableObject {
    @Published var items: [NewsItem] = [NewsItem]()
    lazy var newsService: NewsService? = {
       return NewsService()
    }()
    /*lazy var newsService: NewsMoyaService? = {
       return NewsMoyaService()
    }()*/
    
    func loadNews() {
        newsService?.loadNews(completion: { result in
            switch (result) {
            case .success(let data):
                self.items.removeAll()
                self.items.append(contentsOf: data?.articles ?? [NewsItem]())
            default:
                break
            }
        })
    }
    
}
