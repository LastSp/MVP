//
//  Model.swift
//  MVP(Dep.Inj.) + Unit tests
//
//  Created by Андрей Колесников on 30.09.2021.
//

import Foundation

struct Comment: Codable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
