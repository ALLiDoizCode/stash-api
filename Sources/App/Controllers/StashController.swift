//
//  StashController.swift
//  App
//
//  Created by Jonathan Green on 4/8/20.
//

import Vapor
import MeowVapor

class StashController {
    var router:Router?
    var jsonEncoder = JSONEncoder()
    
    init(router:Router) {
        
        self.router = router
        let route = router.grouped("achievements")
        //route.post("save", use: save)
        route.get("fetch",use: fetch)
    }
    
    func fetch(req: Request) throws -> Future<Achievements> {
        return req.meow().flatMap({ context in
            let achievements = context.findOne(Achievements.self)
            return achievements.map({ object in
                guard let object = object else {
                    let reason = "No objects exist"
                    let identifier = "204"
                    throw APIErrors(identifier: identifier, reason: reason, status: .noContent)
                }
                return object
            })
        })
    }
    
    func save(req: Request) throws -> Future<Achievements> {
        let promise = try req.content.decode(Achievements.self)
        return promise.flatMap { achievements in
            return req.meow().map { context in
                achievements._id = ObjectId().description
                achievements.save(to: context)
                return achievements
            }
        }
    }
}
