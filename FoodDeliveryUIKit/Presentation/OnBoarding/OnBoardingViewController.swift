//
//  OnBoardingViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 13/10/23.
//

import UIKit
import Combine

class OnBoardingViewController: UIViewController {
    
    // MARK: - View Model
    var viewModel = OnboardingViewModel()
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    
    var slides: [OnboardingSlide] = []
    private var subscriptions = Set<AnyCancellable>()
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == viewModel.slides.count - 1 {
                nextButton.setTitle("Continue", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    // MARK: - View Controller's Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setupBindings()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: - Setup Methods
    private func setUpViews() {
        nextButton.setPadding(top: 20, leading: 60, bottom: 20, trailing: 60)
    }
    
    private func setupBindings() {
        viewModel.$slides.sink { (slides: [OnboardingSlide]) in
            self.slides = slides
            self.pageControl.numberOfPages = slides.count
            self.onboardingCollectionView.reloadData()
        }.store(in: &subscriptions)
    }
    
    @IBAction func onClickNextButton(_ sender: Any) {
        
        if currentPage == viewModel.slides.count - 1 {
            performSegue(withIdentifier: "AuthenticationSegue", sender: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.isPagingEnabled = false // Necesssary to fix scrollToItem issue in Xcode 14
            onboardingCollectionView.scrollToItem(
                at: indexPath,
                at: .centeredHorizontally,
                animated: true
            )
            onboardingCollectionView.isPagingEnabled = true // Necesssary to fix scrollToItem issue in Xcode 14
        }
        
    }
}

// MARK: - CollectionView Delegates

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(viewModel.slides[indexPath.row])
        return cell
    }
}

// MARK: - CollectionView FlowLayout Delegate
extension OnBoardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
