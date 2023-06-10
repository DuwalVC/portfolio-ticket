//
//  CategoriasController.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 14/12/22.
//

import Foundation
import UIKit

class CategoriasConfigurator{
    static func mostrarViewController() -> UIViewController {
        let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
        guard let view = storyboardMain.instantiateViewController(withIdentifier: "categoriaStoryboardID") as? CategoriasViewController else {
            return CategoriasViewController()
        }
        let presenter = CategoriasPresenter()
        
        view.presenter = presenter
        
        let interactor = CategoriasInteractor(presenter: presenter, api: TicketsAPI())
        presenter.interactor = interactor
        
        let router = CategoriasRouter(view: view, presenter: presenter)
        presenter.router = router
        
        presenter.view = view
        
        
        
        return view
    }
}
