//
//  CategoriasRouter.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 15/12/22.
//

import Foundation
import UIKit

protocol CategoriasRouterProtocol {
    func presentarListaCategoria(categoria: CategoriaEntity)
}

class CategoriasRouter: CategoriasRouterProtocol{
    
    weak var view: UIViewController?
    weak var presenter: CategoriasPresenterRouterProtocol?
    
    init(view: UIViewController? = nil, presenter: CategoriasPresenterRouterProtocol? = nil) {
        self.view = view
        self.presenter = presenter
    }
    
    func presentarListaCategoria(categoria: CategoriaEntity){
        print("presentarListaCategoria()")
        view?.navigationController?.pushViewController(ListaCategoriaConfigurator.mostrarViewController(categoria: categoria), animated: true)
    }
}
