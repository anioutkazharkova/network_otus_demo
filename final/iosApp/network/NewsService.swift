//
//  NewsService.swift
//  iosApp
//
//  Created by Anna Zharkova on 07.11.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation

class NewsService {
    private lazy var networkService = AlamofireNetworkService()
    func loadNews(completion: @escaping(Result<NewsList?,Error>)->Void) {
        networkService.doRequest(completion: completion)
    }
}
