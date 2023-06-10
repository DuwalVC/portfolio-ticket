//
//  CategoriaPresenter.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 14/12/22.
//

import Foundation

protocol CategoriasPresenterInteractorProtocol: AnyObject{
    func montarListado(categorias categoriasEntity: [CategoriaEntity])
}

protocol CategoriasPresenterRouterProtocol: AnyObject{
    
}

protocol CategoriasPresenterViewProtocol{
    func obtenerCategorias()
    func solicitaPresentarListaCategoria(categoria: CategoriaEntity)
}

class CategoriasPresenter {
    var interactor: CategoriasInteractorProtocol?
    weak var view: CategoriasViewControllerProtocol?
    var router: CategoriasRouterProtocol?
}

extension CategoriasPresenter: CategoriasPresenterInteractorProtocol{
    func montarListado(categorias categoriasEntity: [CategoriaEntity]){
        view?.montarListado(categoriasEntity)
    }
}

extension CategoriasPresenter: CategoriasPresenterRouterProtocol{
    
}

extension CategoriasPresenter: CategoriasPresenterViewProtocol{
    func obtenerCategorias(){
        interactor?.fetchDatos()
    }
    
    func solicitaPresentarListaCategoria(categoria: CategoriaEntity){
        router?.presentarListaCategoria(categoria: categoria)
    }
}
