//
//  EditAddressViewModel.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import Foundation
import Combine

final class EditAddressViewModel: ObservableObject{
    
    let editAddressRepository: EditAddressRepository
    
    @Published private(set) var editAddress: [EditAddress] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init(editAddressRepository: EditAddressRepository) {
        self.editAddressRepository = editAddressRepository
    }
    
    func getEditAddressFromMemory(){
        let editAddressDeMemoria = editAddressRepository.getEditAddressFromMemoria()
        editAddress = editAddressDeMemoria
    }
}
