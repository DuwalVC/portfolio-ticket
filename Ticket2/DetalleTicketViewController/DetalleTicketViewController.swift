//
//  DetalleTicketViewController.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 17/12/22.
//

import UIKit

class DetalleTicketViewController: UIViewController {
    
    @IBOutlet weak var detalleTableView: UITableView!
    
    var evento: EventoEntity?

    override func viewDidLoad() {
        super.viewDidLoad()
        detalleTableView.dataSource = self
    }

}

extension DetalleTicketViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        if section == 0 {
            return 1
        } else {
//            return ticket?.tipoAsiento.count ?? 0
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0, let cell = tableView.dequeueReusableCell(withIdentifier: "detalleIdentifier", for: indexPath) as? DetalleTicketTableViewCell{
            cell.evento = evento
            return cell
        }
//        else if indexPath.section == 1, let cell = tableView.dequeueReusableCell(withIdentifier: "tipoEntradaIdentifier", for: indexPath) as? TipoAsientoTableViewCell {
//            cell.datosTipoAsiento = evento?.tipoAsiento[indexPath.row]
//            return cell
//        }
        return UITableViewCell()
    }
    
    
}
