import Foundation
import UIKit

class EventoDetalleConfigurator{
    static func mostrarViewController(evento: EventoEntity) -> UIViewController {
        let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
        guard let view = storyboardMain.instantiateViewController(withIdentifier: "eventoDetalleStoryboardID") as? EventoDetalleViewController else {
            return EventoDetalleViewController()
        }
        let presenter = EventoDetallePresenter()

        let interactor = EventoDetalleIteractor(presenter: presenter, api: TicketsAPI())
        
        view.evento = evento
        view.presenter = presenter

        let router = EventoDetalleRouter(view: view, presenter: presenter)

        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        
        
        return view
    }
}

