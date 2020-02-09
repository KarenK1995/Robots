//
//  TeamsViewController.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/7/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController {
    
    //MARK: Methods
    @IBOutlet weak var team1TextField: UITextField!
    @IBOutlet weak var team2TextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //MARK: Actions
    @IBAction func startButtonAction(_ sender: UIButton) {
        if areTeamNamesFilled() {
            performSegue(withIdentifier: "StartCompetition", sender: self)
        }
        else {
            errorLabel.isHidden = false
        }
    }
    
    @IBAction func textFieldTextDidChange(_ textField: UITextField) {
        if areTeamNamesFilled() {
            errorLabel.isHidden = true
        }
    }
    
    //MARK: Methods
    private func areTeamNamesFilled() -> Bool {
        guard let name1 = team1TextField.text,
              let name2 = team2TextField.text else {
                return false
        }
        return (!name1.isEmpty && !name2.isEmpty)
    }
}

extension TeamsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
