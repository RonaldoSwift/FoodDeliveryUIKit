//
//  OnBoardingViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 13/10/23.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Continue", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(image: #imageLiteral(resourceName: "Onboarding1"), title: "Wide range of Food Categories & more", description: "Browse through our extensive list of restaurants and dishes, and when you're ready to order, simply add your desired items to your cart and checkout. It's that easy!"),
            OnboardingSlide(image: #imageLiteral(resourceName: "Onboarding2"), title: "Free Deliveries for ONE MONTH!!!", description: "Get your favorite meals delivered to your doorstep for free with our online food delivery app - enjor a whole month of complimentary delivery!"),
            OnboardingSlide(image: #imageLiteral(resourceName: "Onboarding3"), title: "Get started on Ordering your Food", description: "Please create an account or sign in to your existing account to start borwsing our selection of delicious meals from your favorite restaurants."),
        ]
        
        
        setUpViews()
        
        // Do any additional setup after loading the view.
    }
    
    private func setUpViews() {
        nextButton.setPadding(top: 20, leading: 60, bottom: 20, trailing: 60)
    }
    
    
    
    @IBAction func onClickNextButton(_ sender: Any) {
        
        if (currentPage == slides.count - 1) {
            print("navigate to next screen")
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(
                at: indexPath,
                at: .left,
                animated: true
            )
        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
}

extension OnBoardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.size.width,
            height: collectionView.frame.size.height
        )
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        //pageControl.currentPage = currentPage
    }
}
