//
//  UnitTestCoordinator.swift
//  UnitTestCiceBootcamp2022
//
//  Created by Carlos Carrera on 2/5/22.
//

import Foundation
import UIKit

final class UnitTestCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: self.view())
        navVC.navigationBar.isTranslucent = false
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = UnitTestViewController()
        vc.viewModel = self.presenter()
        return vc
    }
    
    static func presenter() -> UnitTestPresenterInputProtocol {
        let presenter = UnitTestPresenter()
        return presenter
    }
}
