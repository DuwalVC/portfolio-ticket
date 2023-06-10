//
//  EventoDetalleRouter.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 15/12/22.
//

import Foundation
import UIKit

protocol EventoDetalleRouterProtocol{
    func presentarVistaRoot()
}

class EventoDetalleRouter{
    weak var view: UIViewController?
    weak var presenter: EventoDetallePresenterRouterProtocol?
    
    init(view: UIViewController? = nil, presenter: EventoDetallePresenterRouterProtocol? = nil) {
        self.view = view
        self.presenter = presenter
    }
}

extension EventoDetalleRouter: EventoDetalleRouterProtocol{
    func presentarVistaRoot(){
        view?.navigationController?.popToRootViewController(animated: true)
    }
}
