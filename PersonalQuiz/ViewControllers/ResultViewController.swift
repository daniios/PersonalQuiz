//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 15.05.2023.
//  Modified by Chupin Daniil on 17.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var pictureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    var answers: [Answer] = []
    private var yourAnimal: Animal? {
        findMostFrequentAnimal()
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        pictureLabel.text = "Вы - \(yourAnimal?.rawValue ?? "?")"
        descriptionLabel.text = yourAnimal?.definition
    }

    // MARK: - IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("ResultViewController is deallocated")
    }
    
    // MARK: - Private methods
    private func findMostFrequentAnimal() -> Animal? {
        var animalCounts: [Animal: Int] = [:]
        var maxCount = 0
        var mostFrequentAnimal: Animal?
        
        for answer in answers {
            if let count = animalCounts[answer.animal] {
                animalCounts[answer.animal] = count + 1
            } else {
                animalCounts[answer.animal] = 1
            }
        }

        for (animal, count) in animalCounts {
            if count > maxCount {
                maxCount = count
                mostFrequentAnimal = animal
            }
        }
        
        return mostFrequentAnimal
    }
}
