//
//  BurguerViewModel.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import Foundation
import Combine

final class BurguerViewModel: ObservableObject {
    
    let burguerRepository: BurguerRepository
    
    @Published private(set) var burguers: [Burguer] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init(burguerRepository: BurguerRepository) {
        self.burguerRepository = burguerRepository
    }
    
    func getBurguerFromMemory(){
        let burguerDeMemoria = burguerRepository.getBurguerFromMmeoria()
        burguers = burguerDeMemoria
    }
}
