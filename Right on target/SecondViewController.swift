//
//  SecondViewController.swift
//  Right on target
//
//  Created by Дмитрий Емелин on 27.09.2022.
//

import UIKit

class SecondViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("foo - load view SecondViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("foo - viewDidLoad SecondViewController")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("foo - viewWillAppear SecondViewController")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("foo - viewDidAppear SecondViewController")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("foo - viewWillDisappear SecondViewController")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("foo - viewDidDisappear SecondViewController")
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
