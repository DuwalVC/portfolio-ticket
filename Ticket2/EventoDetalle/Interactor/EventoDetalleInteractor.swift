//
//  EventoDetalleInteractor.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 16/12/22.
//

import Foundation

protocol EventoDetalleInteractorProtocol{
    func fetchPostDatos(evento: EventoEntity)
}

class EventoDetalleIteractor {
    
    weak var presenter: EventoDetallePresenterInteractorProtocol?
    
    var api: EventosApiProtocol?
    
    init(presenter: EventoDetallePresenterInteractorProtocol? = nil, api: EventosApiProtocol? = nil) {
        self.presenter = presenter
        self.api = api
    }
}

extension EventoDetalleIteractor: EventoDetalleInteractorProtocol{
    
    func fetchPostDatos(evento: EventoEntity)  {
        api?.fetchPostEvento({ evento, error in
            if let evento = evento {
                let _ = EventoEntity.mostrar([evento])
                self.presenter?.mostrarAlerta()
            }else{
                print((String(describing: error)))
            }
        }, evento: evento)
        
    }
}
