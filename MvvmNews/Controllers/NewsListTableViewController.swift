//
//  NewsListTableViewController.swift
//  MvvmNews
//
//  Created by Mehmet Ergün on 2022-06-21.
//

import Foundation
import UIKit

class NewsListTableViewController : UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        navigationController?.title = "News"
    }
    
    private func setup() {

        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=75e18bbbc44f432fae8e1a0fbf71629f") else {return}
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        Webservice().getNews(url: url) { articles in
            
            if let articles = articles {
                
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }
    
}
