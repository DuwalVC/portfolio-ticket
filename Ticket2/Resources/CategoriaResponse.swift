//
//  CategoriaResponse.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 14/12/22.
//

import Foundation

struct CategoriaResponse: Codable {
    let codigo: Int
    let nombre: String
    
    enum CodingKeys: String, CodingKey {
        case codigo = "id"
        case nombre
    }
}


struct EventoResponse: Codable {
    let codigo, comentario, imagen: String
    let categoriaId: Int
    let nombre, organizador, ubicacion, fecha, resumen: String

    enum CodingKeys: String, CodingKey {
        case codigo, comentario, imagen
        case categoriaId
        case nombre, organizador, ubicacion, fecha, resumen
    }
}
