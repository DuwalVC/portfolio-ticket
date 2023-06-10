//
//  ListaCategoriaInteractor.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 15/12/22.
//

import Foundation

protocol ListaCategoriaPresenterInteractorProtocol: AnyObject{
    func montarEventos(eventos: [EventoEntity])
}

protocol ListaCategoriaPresenterRouterProtocol: AnyObject{
    
}

protocol ListaCategoriaPresenterViewProtocol{
    func fetchDatosInteractor(categoriaID: Int)
    func presentarEventoDetalleRouter(evento: EventoEntity)
}

class ListaCategoriaPresenter{
    var interactor: ListaCategoriaIteractorProtocol?
    weak var view: ListaCategoriaViewControllerProtocol?
    var router: ListaCategoriaRouterProtocol?
}

extension ListaCategoriaPresenter: ListaCategoriaPresenterInteractorProtocol{
    func montarEventos(eventos: [EventoEntity]) {
        view?.mostrarListadoEventos(eventos)
    }
    
    
}

extension ListaCategoriaPresenter: ListaCategoriaPresenterRouterProtocol{
    
}

extension ListaCategoriaPresenter: ListaCategoriaPresenterViewProtocol{
    func fetchDatosInteractor(categoriaID: Int) {
        interactor?.fetchDatos(categoriaID: categoriaID)
    }
    
    func presentarEventoDetalleRouter(evento: EventoEntity) {
        router?.presentarEventoDetalle(evento: evento)
    }
    
}
