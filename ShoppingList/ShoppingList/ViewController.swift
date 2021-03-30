//
//  ViewController.swift
//  ShoppingList
//
//  Created by Justin DeMartinis on 3/23/21.
//

import UIKit

class ViewController: UITableViewController {

        var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(startGame))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        title = "Shopping List"
        
        startGame()
    }
    
    @objc func startGame() {
        
        shoppingList.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    func submit(_ answer: String) {
        

        shoppingList.insert(answer, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
        return
    }
    
    @objc func promptForAnswer() {
        
        let ac = UIAlertController(title: "Enter grocery item!", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else {return}
            self?.submit(answer)
            
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }


}

