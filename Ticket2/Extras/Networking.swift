//
//  Networking.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 14/12/22.
//

import Foundation
import Alamofire

protocol CategoriasApiProtocol{
    func fetchCategorias(_ completion: @escaping([CategoriaResponse]?, String?) -> Void )

}

protocol EventosApiProtocol{
    func fetchEventos(_ completion: @escaping([EventoResponse]?, String?) -> Void, categoriaID: Int)
    
    func fetchPostEvento(_ completion: @escaping(EventoResponse?, String?) -> Void, evento: EventoEntity)
}

protocol ListaMisTicketsApiProtocol{
    func fetchEventos(_ completion: @escaping([EventoResponse]?, String?) -> Void)
}


class TicketsAPI {
    let domine = "https://duwalvc.ngrok.dev"
    
}

extension TicketsAPI: CategoriasApiProtocol{
    func fetchCategorias(_ completion: @escaping([CategoriaResponse]?, String?) -> Void ) {
        AF.request("\(domine)/categorias").responseDecodable(of: [CategoriaResponse].self) { response in
            switch response.result {
            case .success(let categorias):
                completion(categorias, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}

extension TicketsAPI: EventosApiProtocol{
    func fetchEventos(_ completion: @escaping([EventoResponse]?, String?) -> Void, categoriaID: Int) {
        AF.request("\(domine)/categorias/\(categoriaID)/eventos").responseDecodable(of: [EventoResponse].self) { response in
            switch response.result {
            case .success(let categorias):
                completion(categorias, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func fetchPostEvento(_ completion: @escaping(EventoResponse?, String?) -> Void, evento: EventoEntity) {
        AF.request("\(domine)/ticketsUsuario", method: .post, parameters: evento, encoder: JSONParameterEncoder.default).responseDecodable(of: EventoResponse.self) { response in
            
            switch response.result {
            case .success(let categoria):
                completion(categoria, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}

extension TicketsAPI: ListaMisTicketsApiProtocol{
    func fetchEventos(_ completion: @escaping([EventoResponse]?, String?) -> Void) {
        AF.request("\(domine)/ticketsUsuario").responseDecodable(of: [EventoResponse].self) { response in
            switch response.result {
            case .success(let categorias):
                completion(categorias, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
