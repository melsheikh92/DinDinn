//
//  BaseRepository.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import Foundation
import Moya

public extension MoyaProvider {
    final class func interceptorMapper(for endpoint: Endpoint, closure: RequestResultClosure) {
        defer { DinDinnLoader.hideLoader() }
        DinDinnLoader.showLoader()
        do {
            let urlRequest = try endpoint.urlRequest()
            closure(.success(urlRequest))
        } catch MoyaError.requestMapping(let url) {
            closure(.failure(MoyaError.requestMapping(url)))
        } catch MoyaError.parameterEncoding(let error) {
            closure(.failure(MoyaError.parameterEncoding(error)))
        } catch {
            closure(.failure(MoyaError.underlying(error, nil)))
        }
    }
}
