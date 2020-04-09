//
//  APIError.swift
//  App
//
//  Created by Jonathan Green on 4/9/20.
//

import Vapor
class APIErrors:AbortError {
    var status: HTTPResponseStatus
    var identifier: String
    var reason: String
    
    init(identifier:String,reason:String,status:HTTPResponseStatus) {
        self.identifier = identifier
        self.reason = reason
        self.status = status
    }
}
