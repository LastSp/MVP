//
//  DetailViewController.swift
//  MVP
//
//  Created by Андрей Колесников on 01.10.2021.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var presenter: DetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }
    @IBAction func returnTap(_ sender: Any) {
        presenter.tap()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComments(comment: Comment?) {
        nameLabel.text = comment?.name
        emailLabel.text = comment?.email
        bodyLabel.text = comment?.body
    }
}
