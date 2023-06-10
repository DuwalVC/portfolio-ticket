//
//  EventoEntity.swift
//  Ticket2
//
//  Created by Duwal Abel Varillas Castro on 15/12/22.
//

import Foundation

struct EventoEntity: Encodable {
    let codigo: String
    let nombre: String
    let comentario: String
    let imagen: String
    let categoriaId: Int
    let organizador: String
    let ubicacion: String
    let fecha: String
    let resumen: String
    
    static func mostrar(_ eventos: [EventoResponse]) -> [EventoEntity]{
        eventos.map { EventoEntity(codigo: $0.codigo ,nombre: $0.nombre, comentario: $0.comentario, imagen: $0.imagen, categoriaId: $0.categoriaId, organizador: $0.organizador, ubicacion: $0.ubicacion, fecha: $0.fecha, resumen: $0.resumen)}
    }
}
