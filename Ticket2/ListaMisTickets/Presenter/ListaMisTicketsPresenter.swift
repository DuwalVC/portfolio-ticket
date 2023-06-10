//
//  ListaMisTicketsPresenter.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 17/12/22.
//

import Foundation

protocol ListaMisTicketsPresenterViewProtocol{
    func presentarDetalle(evento: EventoEntity)
    func fetchDatosInteractor()
}

protocol ListaMisTicketsPresenterInteractorProtocol: AnyObject{
    func montarEventos(eventos: [EventoEntity])
}

protocol ListaMisTicketsPresenterRouterProtocol: AnyObject{
    
}


class ListaMisTicketsPresenter{
    weak var view: ListaMisTicketsViewControllerProtocol?
    var interactor: ListaMisTicketsInteractorProtocol?
    var router: ListaMisTicketsRouterProtocol?
    
}

extension ListaMisTicketsPresenter: ListaMisTicketsPresenterViewProtocol{
    func presentarDetalle(evento: EventoEntity) {
        router?.presentarDetalle(evento: evento)
    }
    
    func fetchDatosInteractor(){
        interactor?.fetchDatosInteractor()
    }
    
}

extension ListaMisTicketsPresenter: ListaMisTicketsPresenterInteractorProtocol{
    func montarEventos(eventos: [EventoEntity]){
        view?.montarEventos(eventos: eventos)
    }
}

extension ListaMisTicketsPresenter: ListaMisTicketsPresenterRouterProtocol{
    
}
