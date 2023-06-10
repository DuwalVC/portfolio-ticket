//
//  ListaMisTicketsRouter.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 17/12/22.
//

import Foundation
import UIKit

protocol ListaMisTicketsRouterProtocol{
    func presentarDetalle(evento: EventoEntity)
}

class ListaMisTicketsRouter{
    
    weak var view: ListaMisTicketsViewController?
    
    weak var presenter: ListaMisTicketsPresenterRouterProtocol?
    
    init(view: ListaMisTicketsViewController? = nil, presenter: ListaMisTicketsPresenterRouterProtocol? = nil) {
        self.view = view
        self.presenter = presenter
    }
}

extension ListaMisTicketsRouter: ListaMisTicketsRouterProtocol{
    func presentarDetalle(evento: EventoEntity){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detalleTicketView = mainStoryboard.instantiateViewController(withIdentifier: "detalleTicketStoryboard") as? DetalleTicketViewController else {
            return
        }
        detalleTicketView.evento = evento
        view?.navigationController?.pushViewController(detalleTicketView, animated: true)
    }
}
