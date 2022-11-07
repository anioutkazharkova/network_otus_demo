//
//  NewsMoyaService.swift
//  iosApp
//
//  Created by Anna Zharkova on 07.11.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import Moya

class NewsMoyaService {
    private lazy var provider = MoyaProvider<NetworkMoyaService>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])

    
    func loadNews(completion: @escaping(Result<NewsList?,Error>)->Void) {
        provider.request(.getNews) { result in
            switch result {
            case .success(let response):
                let data =  response.data
                    let newsResponse = try? JSONDecoder().decode(NewsList.self, from: data)
                    completion(.success(newsResponse))
               
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
                completion(.failure(error))
            }
        }
    }
}
