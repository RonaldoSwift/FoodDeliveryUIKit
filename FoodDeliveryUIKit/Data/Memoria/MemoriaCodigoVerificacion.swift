//
//  MemoriaCodigoVerificacion.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo on 18/10/23.
//

import Foundation

class MemoriaCodigoVerificacion{
    static var codigo : Array<Codigo> = [Codigo(primerDigitoText: "1", segundoDigitoText: "", tercerDigitoText: "2", cuartoDigitoText: "3", quintoDigitoText: "4", sextoDigitoText: "5")]
}

struct Codigo{
    let primerDigitoText: String
    let segundoDigitoText: String
    let tercerDigitoText: String
    let cuartoDigitoText: String
    let quintoDigitoText: String
    let sextoDigitoText: String
}
