//
//  DiffereceViewController.swift
//  MyStory
//
//  Created by lemonshark on 2023/2/27.
//

import UIKit

class DiffereceViewController: UIViewController {

    @IBOutlet weak var redpanda: UIStackView!
    
    @IBOutlet weak var panda: UIImageView!
    
    let pandainfo = Informat(name: "Panda", image:UIImage(named: "4")!, type: "", weight: "80 - 120", length: 1.2, diet: "Bamboo", region: "China", speed: 10)
    
    let redpandainfo = Informat(name: "Red Panda", image:UIImage(named: "2")!, type: "", weight: "5", length: 0.6, diet: "Apple", region: "Myanmar, Nepal, India, China", speed: 8)
    
    var animaltype: [Informat] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        animaltype = [pandainfo, redpandainfo];
        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapPanda(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            performSegue(withIdentifier: "detailsSegue", sender: tappedView)
        }
    }
    
    @IBAction func didTapRedPanda(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            performSegue(withIdentifier: "detailsSegue", sender: tappedView)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "detailsSegue",
            let tappedView = sender as? UIView,
            let detailViewController = segue.destination as? DetailViewController {

            if tappedView.tag == 0 {
                detailViewController.info = animaltype[0]
            } else if tappedView.tag == 1 {
                detailViewController.info = animaltype[1]
            } else {
                print("no Dinosaur was tapped, please check your selection.")
            }
        }
    }
}
