//
//  OperationViewController.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/29.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit

class OperationViewController: UIViewController {
    
    
    var topMargin: CGFloat = 20.0
    
    var snippets: [SnippetModel] = []
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var snippetCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            topMargin = window?.safeAreaInsets.top ?? 20.0
        }
        topConstraint.constant = topMargin
        
        view.backgroundColor = CELLO
        snippetCollection.backgroundColor = CELLO
        let test = SnippetModel(name: "a test")
        snippets.append(test)
        snippets.append(test)
        snippets.append(test)

        snippetCollection.dragInteractionEnabled = true
        snippetCollection.reloadData()
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

extension OperationViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return snippets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SnippetCollectionViewCell", for: indexPath) as! SnippetCollectionViewCell
        return cell
    }
    
}

extension OperationViewController: UICollectionViewDragDelegate,  UICollectionViewDropDelegate {
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
//        let snippet = snippets[indexPath.row]
        let item = NSItemProvider(object: UIImage(named: "1234")!)
        let dragItem = UIDragItem(itemProvider: item)
        return [dragItem]
    }
    
    func remove(at indexPath: IndexPath) {
        snippets.remove(at: indexPath.row)
    }
    
    func insert(_ snippet: SnippetModel, at indexPath: IndexPath) {
        snippets.insert(snippet, at: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
        return true
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        guard let dest = coordinator.destinationIndexPath else { return }
        coordinator.items.forEach { dropItem in
            guard let sourceIndexPath = dropItem.sourceIndexPath else { return }
            collectionView.performBatchUpdates({
                let snippet = snippets[sourceIndexPath.row]
                remove(at: sourceIndexPath)
                insert(snippet, at: dest)
                collectionView.deleteItems(at: [sourceIndexPath])
                collectionView.insertItems(at: [dest])
            }, completion: { _ in
                coordinator.drop(dropItem.dragItem, toItemAt: dest)
            })
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
}
