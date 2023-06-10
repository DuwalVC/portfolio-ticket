//
//  ListaMisTicketsViewController.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 17/12/22.
//

import UIKit

protocol ListaMisTicketsViewControllerProtocol: AnyObject{
    func montarEventos(eventos: [EventoEntity])
}

class ListaMisTicketsViewController: UIViewController {

    var ticketsComprados: [EventoEntity] = [ ]
    
    var presenter: ListaMisTicketsPresenterViewProtocol?
    
    @IBOutlet weak var ticketsCompradosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ticketsCompradosTableView.dataSource = self
        ticketsCompradosTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.fetchDatosInteractor()
    }
}

extension ListaMisTicketsViewController: ListaMisTicketsViewControllerProtocol{
    func montarEventos(eventos: [EventoEntity]) {
        ticketsComprados = eventos
        ticketsCompradosTableView.reloadData()
    }
    
    
}

extension ListaMisTicketsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tickets Comprados"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ticketsComprados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "celdaTicketCompradoIdentifier", for: indexPath) as? MiEventoTableViewCell else {
            return MiEventoTableViewCell()
            
        }
        
        cell.evento = ticketsComprados[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter?.presentarDetalle(evento: ticketsComprados[indexPath.row])
    }
}
