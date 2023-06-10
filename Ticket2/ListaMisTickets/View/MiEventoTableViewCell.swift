//
//  EventosTableViewCell.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 17/12/22.
//

import UIKit

class MiEventoTableViewCell: UITableViewCell {

    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var organizadorLabel: UILabel!
    
    @IBOutlet weak var ubicacionLabel: UILabel!
    
    var evento: EventoEntity?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        asignarDatosDeEvento()
    }
    
    func asignarDatosDeEvento(){
        nombreLabel.text = evento?.nombre
        organizadorLabel.text = evento?.organizador
        ubicacionLabel.text = evento?.ubicacion
    }

}
