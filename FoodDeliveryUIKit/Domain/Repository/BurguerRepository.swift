//
//  BurguerRepository.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 4/12/23.
//

import Foundation
import Combine

class BurguerRepository{
    
    let memoriaBurguer: MemoriaBurguer
    
    var canelLables = Set<AnyCancellable>()
    
    init(memoriaBurguer: MemoriaBurguer) {
        self.memoriaBurguer = memoriaBurguer
    }
    
    func getBurguerFromMmeoria() -> Array<Burguer>{
        return memoriaBurguer.fastFood.map { (burguerData: BurguerData) in
            let burguer = Burguer(
                id: burguerData.id,
                imageburguer: burguerData.imageburguer,
                title: burguerData.title,
                imageLogo: burguerData.imageLogo,
                nameMarca: burguerData.nameMarca,
                description: burguerData.description,
                aceptable: burguerData.aceptable
            )
            return burguer
        }
    }
}
