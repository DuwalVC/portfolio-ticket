//
//  TableViewCell.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 17/12/22.
//

import UIKit

class DetalleTicketTableViewCell: UITableViewCell {

    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var qrImageView: UIImageView!
    
    @IBOutlet weak var fechaLabel: UILabel!
    
    @IBOutlet weak var organizadorLabel: UILabel!
    
    @IBOutlet weak var direccionLabel: UILabel!
    
    var evento: EventoEntity?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
        asignarDatosDeEvento()
    }
    
    func asignarDatosDeEvento(){
        nombreLabel.text = evento?.nombre
//        fechaLabel.text = evento?.fecha
        organizadorLabel.text = evento?.organizador
        direccionLabel.text = evento?.ubicacion
        qrImageView.image = generarQR()
    }
    
    func generarQR() -> UIImage? {
        let data = evento?.codigo.data(using: .ascii)
        if let filtro = CIFilter(name: "CIQRCodeGenerator") {
            filtro.setValue(data, forKey: "inputMessage")
            let transformador = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filtro.outputImage?.transformed(by: transformador)  {
                let imagen = UIImage(ciImage: output)
                return imagen
            }
        }
        return nil
    }

}
