//
//  MemoriaSearch.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 27/11/23.
//

import Foundation

class MemoriaSearch{
    var fastFood: Array<SearchData> = [
        SearchData(
            id: 0,
            imageburguer: "https://img.freepik.com/foto-gratis/sabrosa-hamburguesa-aislada-sobre-fondo-blanco-comida-rapida-hamburguesa-fresca-carne-queso_90220-1063.jpg?w=1380&t=st=1701301501~exp=1701302101~hmac=f842093e28e46584ed49585f59c217ba0740888df66a82ce7f3130099484f02d",
            title: "BBQ Chicken Burger",
            imageLogo: "",
            nameMarca: "KFC",
            description: "",
            aceptable: true
        ),
        SearchData(
            id: 1,
            imageburguer: "https://1000marcas.net/wp-content/uploads/2020/01/KFC-logo-2006.jpg",
            title: "KFC",
            imageLogo: "",
            nameMarca: "10565 Bramlea Road, Brampton, ON",
            description: "",
            aceptable: false
        ),
        SearchData(id: 2,
                   imageburguer: "https://logodownload.org/wp-content/uploads/2014/04/mcdonalds-logo-8.png",
                   title: "McDonald’s", imageLogo: "",
                   nameMarca: "18915 Queens Road, Brampton, ON",
                   description: "",
                   aceptable: false
                  )
    ]
}
