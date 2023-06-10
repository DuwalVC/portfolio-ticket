//
//  ListaCategoriaViewController.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 15/12/22.
//

import UIKit

protocol ListaCategoriaViewControllerProtocol: AnyObject{
    func mostrarListadoEventos(_ listaEventos: [EventoEntity])
}

class ListaCategoriaViewController: UIViewController {
    
    var categoria: CategoriaEntity!
    
    var listaEventos: [EventoEntity] = [ ]
    
    var presenter: ListaCategoriaPresenterViewProtocol?

    @IBOutlet weak var eventosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventosTableView.dataSource = self
        eventosTableView.delegate = self
        
        presenter?.fetchDatosInteractor(categoriaID: categoria!.codigo)
    }

}

extension ListaCategoriaViewController: ListaCategoriaViewControllerProtocol{
    func mostrarListadoEventos(_ listaEventos: [EventoEntity]) {
        self.listaEventos = listaEventos
        eventosTableView.reloadData()
    }
    
}

extension ListaCategoriaViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaEventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "celdaEventoCompradoIdentifier") as? EventoTableViewCell else {
            return EventoTableViewCell()
        }
        cell.asignarDatosDeEvento(evento: listaEventos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.presentarEventoDetalleRouter(evento: listaEventos[indexPath.row])
    }
}
