//
//  Presenter.swift
//  MVP(Dep.Inj.) + Unit tests
//
//  Created by Андрей Колесников on 30.09.2021.
//

import Foundation
import UIKit

protocol mainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol mainPresenterProtocol: AnyObject {
    init(view: mainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? {get set}
    func tapOnTheComment(comment: Comment?)
}

class MainPresenter: mainPresenterProtocol {

    weak var view: mainViewProtocol?
    var router: RouterProtocol!
    weak var networkService: NetworkServiceProtocol!
    
    var comments: [Comment]?
    
    required init(view: mainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }
    
    func getComments() {
        networkService.getComments  {[weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                    
                }
            }
 
        }
    }
    
    func tapOnTheComment(comment: Comment?) {
        router.showDetail(comment: comment)
    }
    
}
