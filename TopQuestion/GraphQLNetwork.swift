//
//  GraphQLNetwork.swift
//  TopQuestion
//
//  Created by Tadas Stankevicius on 31/05/2020.
//  Copyright © 2020 Matteo Manferdini. All rights reserved.
//

import Apollo
import Foundation

class GraphQLNetwork {
    
    static let shared = GraphQLNetwork()
    
    private(set) lazy var apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "X-Parse-Application-Id": "O5wVjPatXA9CMi6o9tHkI1DnA9lyNNEGMRf3YVr8",
            "X-Parse-Client-Key": "MFeo0lo70a62xiQD71AHGSkUL4fjVnebt5ZR4tla"
        ]

        var url = URL(string: "https://parseapi.back4app.com/graphql")!
        
        if ProcessInfo.processInfo.arguments.contains("UITEST") {
            url = URL(string: "http://localhost:8080/graphql")!
        }

        return ApolloClient(
            networkTransport: HTTPNetworkTransport(
                url: url,
                client: URLSessionClient(sessionConfiguration: configuration)
            )
        )
    }()
}
