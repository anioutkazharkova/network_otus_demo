//
//  AlamofireNetworkService.swift
//  iosApp
//
//  Created by Anna Zharkova on 07.11.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireNetworkService {
    let sessionManager: Session = {
      //2
      let configuration = URLSessionConfiguration.af.default
      //3
      configuration.timeoutIntervalForRequest = 30
      //4
      return Session(configuration: configuration)
    }()

    func doRequest(completion: @escaping(Result<NewsList?,Error>)->Void) {
        AF.request("https://newsapi.org/v2/everything?q=science", method: .get,headers: HTTPHeaders(["X-Api-Key":"5b86b7593caa4f009fea285cc74129e2"])) .response { response in
            if let data = response.data {
                let newsResponse = try? JSONDecoder().decode(NewsList.self, from: data)
                completion(.success(newsResponse))
            }
        }
    }
}
