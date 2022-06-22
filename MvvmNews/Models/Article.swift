//
//  Article.swift
//  MvvmNews
//
//  Created by Mehmet Ergün on 2022-06-22.
//

import Foundation

struct ArticleList: Decodable {
    var articles : [Article]
}

struct Article: Decodable {
    
    let title: String?
    let description: String?
    
}
