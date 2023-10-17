//
//  OnboardingViewModel.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 17/10/23.
//

import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
    
    @Published var slides: [OnboardingSlide] = [
        OnboardingSlide(image: #imageLiteral(resourceName: "Onboarding1"), title: "Wide range of Food Categories & more", description: "Browse through our extensive list of restaurants and dishes, and when you're ready to order, simply add your desired items to your cart and checkout. It's that easy!"),
        OnboardingSlide(image: #imageLiteral(resourceName: "Onboarding2"), title: "Free Deliveries for ONE MONTH!!!", description: "Get your favorite meals delivered to your doorstep for free with our online food delivery app - enjor a whole month of complimentary delivery!"),
        OnboardingSlide(image: #imageLiteral(resourceName: "Onboarding3"), title: "Get started on Ordering your Food", description: "Please create an account or sign in to your existing account to start borwsing our selection of delicious meals from your favorite restaurants."),
    ]
    
}
