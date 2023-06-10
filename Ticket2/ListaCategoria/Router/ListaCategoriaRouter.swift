//
//  ListaCategoriaRouter.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 15/12/22.
//

import Foundation
import UIKit


protocol ListaCategoriaRouterProtocol{
    func presentarEventoDetalle(evento: EventoEntity)
}

class ListaCategoriaRouter{
    
    weak var view: UIViewController?
    
    weak var presenter: ListaCategoriaPresenterRouterProtocol?
    
    init(view: UIViewController? = nil, presenter: ListaCategoriaPresenterRouterProtocol? = nil) {
        self.view = view
        self.presenter = presenter
    }
}

extension ListaCategoriaRouter: ListaCategoriaRouterProtocol{
    
    func presentarEventoDetalle(evento: EventoEntity){
        view?.navigationController?.pushViewController(EventoDetalleConfigurator.mostrarViewController(evento: evento), animated: true)
    }
    
}
