//
//  EventoDetallePresenter.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 15/12/22.
//

import Foundation

protocol EventoDetallePresenterViewProtocol{
    func fetchObtenerEvento(evento: EventoEntity)
    func presentarVistaRoot()
}

protocol EventoDetallePresenterRouterProtocol: AnyObject{
    
}

protocol EventoDetallePresenterInteractorProtocol: AnyObject{
    func mostrarAlerta()
}

class EventoDetallePresenter{
    weak var view: EventoDetalleViewControllerProtocol?
    var router: EventoDetalleRouterProtocol?
    var interactor: EventoDetalleInteractorProtocol?
}

extension EventoDetallePresenter: EventoDetallePresenterViewProtocol{
    func presentarVistaRoot() {
        router?.presentarVistaRoot()
    }
    
    func fetchObtenerEvento(evento: EventoEntity) {
        interactor?.fetchPostDatos(evento: evento)
    }
    
}

extension EventoDetallePresenter: EventoDetallePresenterRouterProtocol{
    
}

extension EventoDetallePresenter: EventoDetallePresenterInteractorProtocol{
    func mostrarAlerta() {
        view?.mostrarAlerta()
    }
    
    
}
