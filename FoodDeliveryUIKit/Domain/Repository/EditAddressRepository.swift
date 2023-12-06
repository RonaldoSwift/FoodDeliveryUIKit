//
//  EditAddressRepository.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 5/12/23.
//

import Foundation
import Combine

class EditAddressRepository{
    
    let memoriaEditAdress: MemoriaEditAdress
    
    var cancelLables = Set<AnyCancellable>()
    
    init(memoriaEditAdress: MemoriaEditAdress) {
        self.memoriaEditAdress = memoriaEditAdress
    }
    
    func getEditAddressFromMemoria() -> Array<EditAddress>{
        return memoriaEditAdress.fastFood.map { (editAdressData:EditAdressData) in
            let editAddre = EditAddress(
                id: editAdressData.id,
                imageCategories: editAdressData.imageLog,
                title: editAdressData.description
            )
            return editAddre
        }
    }
}
