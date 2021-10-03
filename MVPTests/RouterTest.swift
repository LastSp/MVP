//
//  RouterTest.swift
//  MVPTests
//
//  Created by Андрей Колесников on 02.10.2021.
//

import XCTest
@testable import MVP

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
    
    
}

class RouterTest: XCTestCase {
    
    
    var router: RouterProtocol!
    var navigationController = MockNavigationController()

    override func setUp() {
        let assembly = AssemblyBuilder()
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }
    
    override func tearDown() {
        router = nil
    }

    func testRouter() {
        router.showDetail(comment: nil)
        let detailVC = navigationController.presentedVC
        XCTAssertTrue(detailVC is DetailViewController)
    }
}
