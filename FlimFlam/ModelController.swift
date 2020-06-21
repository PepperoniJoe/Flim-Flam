//
//  ModelController.swift
//  FlimFlam
//
//  Created by Marcy Vernon on 10/31/18.
//  Copyright © 2018 Marcy Vernon. All rights reserved.
//

import UIKit

typealias FlimFlam = (pageTitle: String, puzzle: String, answer: String)

class ModelController: NSObject, UIPageViewControllerDataSource {

    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> DataViewController? {
        // Return the data view controller for the given index.
        if (pageData.count == 0) || (index >= pageData.count - 1) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        dataViewController.dataObject.pageTitle = pageData[index].pageTitle
        dataViewController.dataObject.puzzle    = pageData[index].puzzle
        dataViewController.dataObject.answer    = pageData[index].answer
        return dataViewController
    }

    
    func indexOfViewController(_ viewController: DataViewController) -> Int {
        // Return the index of the given data view controller.
        let data = viewController.dataObject
        let page: FlimFlam = (data.pageTitle, data.puzzle, data.answer)
        
        var pageIndex = 0
        
        if let index = pageData.firstIndex(where: { $0 == page }) {
            pageIndex = index
        } else {
            pageIndex = NSNotFound
        }
        
        return pageIndex
    }
    

  // MARK: - Page View Controller Data Source

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = Int()
    
        if let vc = viewController as? DataViewController {
            index = indexOfViewController(vc)
            if (index == 0) || (index == NSNotFound) {
                return nil
            }
            
            index -= 1
            
            let storyboard = viewController.storyboard ?? UIStoryboard()
            return viewControllerAtIndex(index, storyboard: storyboard)
        }
        return nil
    }

    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = indexOfViewController(viewController as! DataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == pageData.count {
            return nil
        }
        
        let storyboard = viewController.storyboard ?? UIStoryboard()
        return viewControllerAtIndex(index, storyboard: storyboard)
    }
    
    var pageData: [FlimFlam] = [
        ("Flim Flam\n#1","Explain the meaning of this acronym.\nETMOTA", "It stands for\nExplain The Meaning Of This Acronym"),
        ("Flim Flam\n#2","What letter is exactly in the middle of the alphabet?", "The letter P is in the middle of THE ALPHABET"),
        ("Flim Flam\n#3","What's the opposite of \"not in\"?","In"),
        ("Flim Flam\n#4","A deaf and mute man and a blind man entered a hardware store together. The deaf and mute man indicated to the clerk that he wanted a saw by pretending to saw a piece of wood. The blind man wanted a pair of scissors. \n\nHow did he make the clerk understand what he wanted?", "The blind man said, \"I'd like to buy a pair of scissors.\""),
        ("Flim Flam\n#5","The blind man in the previous question was with a friend on a hunting trip. The friend hung the blind man's hat over a projection, the blind man walked 100 yards away, turned around, and easily shot a bullet through his hat. \n\nHow did he do it?","The hat was hung on the end of the gun"),
        ("Flim Flam\n#6","Which would you prefer—that a lion ate you or a tiger?","You would prefer that the lion ate the tiger"),
        ("Flim Flam\n#7","Irrational numbers such as π or the √2 are said to be NEVER ODD OR EVEN. What's so remarkable about that description?","NEVER ODD OR EVEN is a palindrome, reading the same backward and forward"),
        ("Flim Flam\n#8","You throw a die 20 times and it comes up 5 on 17 out of 20 tosses. \n\nWhat's your best bet for the next roll?","Bet on 5. The die is probably loaded."),
        ("Flim Flam\n#9","Tennis players and bowlers wear shoes with laces. Football players wear shoes with cleats.\n\nIn what sport are the shoes made entirely of metal?","Horse racing"),
        ("Flim Flam\n#10","Punctuate the following couplet to make it rhyme: \n\nThere was an old farmer and he \nWas deaf as a post.", "Change post to p-o-s-t"),
        ("Flim Flam\n#11","What unusual word of seven letters has three U's in it?","Unusual"),
        ("Flim Flam\n#12","One class has seven times as many boys as girls. Let b stand for boys and g for girls.\n\nWrite the equation that expresses the ratio.","7g = b (Most people write 7b=g)"),
        ("Flim Flam\n#13","How many animals did Moses put on the ark?","None. Noah built the ark"),
        ("Flim Flam\n#14","Said a carpenter to his assistant \"Dawitcanooseeeyeoteyeoutullaails?\"\n\nWhat was he trying to say?","\"Damn it, can't you see I've got my mouth full of nails?\""),
        ("Flim Flam\n#15","How do you keep a moron in suspense?","This question will be answered in a future app"),
        ("Flim Flam\n#15","How do you keep a moron in suspense?","This question will be answered in a future app")
    ]
}


