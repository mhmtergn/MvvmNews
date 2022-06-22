//
//  Webservice.swift
//  MvvmNews
//
//  Created by Mehmet Ergün on 2022-06-21.
//

import Foundation
import UIKit


class Webservice {
    
    func getNews(url: URL , completion: @escaping ([Article]?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from:data)
            
                if let articleList = articleList {
                    
                    completion(articleList.articles)
                    
                }
                
                print(articleList?.articles)
        }
        
        }.resume()
    
}
}
//func makeAlert(titleInput: String, messageInput: String) {
//
//    let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
//    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
//    alert.addAction(okButton)
//
//
//}
