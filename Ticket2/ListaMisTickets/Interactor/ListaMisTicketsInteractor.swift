//
//  ListaMisTicketsIteractor.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 17/12/22.
//

import Foundation

protocol ListaMisTicketsInteractorProtocol{
    func fetchDatosInteractor()
}

class ListaMisTicketsInteractor{
    
    var api: ListaMisTicketsApiProtocol?
    
    weak var presenter: ListaMisTicketsPresenterInteractorProtocol?
    
    init(api: ListaMisTicketsApiProtocol? = nil, presenter: ListaMisTicketsPresenterInteractorProtocol? = nil) {
        self.api = api
        self.presenter = presenter
    }
}

extension ListaMisTicketsInteractor: ListaMisTicketsInteractorProtocol{
    func fetchDatosInteractor(){
        api?.fetchEventos({ eventos, error in
            if let eventos = eventos {
                let eventosEntity = EventoEntity.mostrar(eventos)
                self.presenter?.montarEventos(eventos: eventosEntity)
            }else{
                print(error!)
            }
        })
    }

}
