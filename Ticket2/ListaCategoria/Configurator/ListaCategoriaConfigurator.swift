import Foundation
import UIKit

class ListaCategoriaConfigurator{
    static func mostrarViewController(categoria: CategoriaEntity) -> UIViewController {
        let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
        guard let view = storyboardMain.instantiateViewController(withIdentifier: "listaCategoriaStoryboardID") as? ListaCategoriaViewController else {
            return ListaCategoriaViewController()
        }
        let presenter = ListaCategoriaPresenter()

        view.categoria = categoria
        view.presenter = presenter

        let interactor = ListaCategoriaIteractor(presenter: presenter, api: TicketsAPI())

        
        let router = ListaCategoriaRouter(view: view, presenter: presenter)

        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        
        
        return view
    }
}

