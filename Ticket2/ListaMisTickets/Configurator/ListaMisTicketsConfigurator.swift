//
//  ListaMisTicketsConfigurator.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 17/12/22.
//

import Foundation
import UIKit

class ListaMisTicketsConfigurator{
    static func mostrarViewController() -> UIViewController {
        let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
        guard let view = storyboardMain.instantiateViewController(withIdentifier: "listaMisTicketsStoryboardID") as? ListaMisTicketsViewController else {
            return ListaMisTicketsViewController()
        }
        let presenter = ListaMisTicketsPresenter()

        view.presenter = presenter

        let interactor = ListaMisTicketsInteractor(api: TicketsAPI(), presenter: presenter)

        let router = ListaMisTicketsRouter(view: view, presenter: presenter)

        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        
        
        return view
    }
}
