//
//  EventoDetalleViewController.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 15/12/22.
//

import UIKit
import Kingfisher

protocol EventoDetalleViewControllerProtocol: AnyObject{
    func montarDatos(evento: EventoEntity)
    func mostrarAlerta()
}

class EventoDetalleViewController: UIViewController {

    @IBOutlet weak var flyerImageView: UIImageView!
    
    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var comentarioLabel: UILabel!
    
    @IBOutlet weak var ubicacionLabel: UILabel!
    
    @IBOutlet weak var resumenLabel: UILabel!
    
    @IBAction func obtenerTicket(_ sender: Any) {
        
        if let evento = evento {
            presenter?.fetchObtenerEvento(evento: evento)
        }
        
    }
    
    var evento: EventoEntity?
    
    var presenter: EventoDetallePresenterViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        montarDatos(evento: evento!)
    }

}

extension EventoDetalleViewController: EventoDetalleViewControllerProtocol{
    func mostrarAlerta() {
        let alerta = UIAlertController(title: "Exito!", message: "Adquirio Ticket", preferredStyle: UIAlertController.Style.actionSheet)
        let accion1 = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { _ in
            self.presenter?.presentarVistaRoot()
        }

        alerta.addAction(accion1)

        self.present(alerta, animated: true)
    }
    
    func montarDatos(evento: EventoEntity){
        nombreLabel.text = evento.nombre
        comentarioLabel.text = evento.comentario
        ubicacionLabel.text = evento.ubicacion
        resumenLabel.text = evento.resumen
        flyerImageView.kf.setImage(with: URL(string: evento.imagen))
    }
}
