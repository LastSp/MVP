//
//  DetailPresenter.swift
//  MVP
//
//  Created by Андрей Колесников on 01.10.2021.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComments(comment: Comment?)
}

protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
    func setComment()
    func tap()
}


class DetailPresenter: DetailPresenterProtocol {

    weak var view: DetailViewProtocol?
    var router: RouterProtocol!
    let networkService: NetworkServiceProtocol!
    var comment: Comment?
    
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }
    
    func setComment() {
        self.view?.setComments(comment: comment)
    }
    
    func tap() {
        router.popToRoot()
    }
    
}
