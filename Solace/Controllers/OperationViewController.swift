//
//  OperationViewController.swift
//  Solace
//
//  Created by LiLi Kazine on 2019/3/29.
//  Copyright © 2019 LiLi Kazine. All rights reserved.
//

import UIKit
import AVKit

class OperationViewController: UIViewController {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var snippetCollection: UICollectionView!
    
    @IBOutlet weak var bgImgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    
    var snippets: [SnippetModel] = []
    
    var playerView: VideoPlayerView!
    
    private var indexPathOfSnippetOnPlaying: IndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = CELLO
                
        snippetCollection.backgroundColor = CELLO
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
        cell.setup(snippets[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        indexPathOfSnippetOnPlaying = indexPath
        
        let snippet = snippets[indexPath.row]
        let frameInCollection = snippetCollection.layoutAttributesForItem(at: indexPath)?.frame ?? CGRect(x: 0, y: 0, width: 160, height: 120)
        let frameInView = snippetCollection.convert(frameInCollection, to: view)
        
        playerView = VideoPlayerView(frame: frameInView)
        playerView.backgroundColor = .black
        playerView.clipsToBounds = true
        playerView.thumbnail = snippet.thumbnail
        view.addSubview(playerView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closePlayer(_:)))
        playerView.addGestureRecognizer(tapGesture)

        let url = snippets[indexPath.row].url
        openPlayer(indexPath) {
            self.play(url)
        }
    }
    
    func openPlayer(_ indexPath: IndexPath, completion: @escaping ()->Void) {
        
        UIView.animate(withDuration: 0.4, animations: {
            self.playerView.frame = CGRect(x: 0, y: self.view.bounds.height/4, width: self.view.bounds.width, height: self.view.bounds.width*9/16)
            self.playerView.layoutIfNeeded()
        }) { _ in
            completion()
        }
    }
    
    @objc func closePlayer(_ gesture: UITapGestureRecognizer) {
        
        if let indexPath = indexPathOfSnippetOnPlaying {
            let frameInCollection = snippetCollection.layoutAttributesForItem(at: indexPath)?.frame ?? CGRect(x: 0, y: 0, width: 0, height: 0)
            let frameInView = snippetCollection.convert(frameInCollection, to: view)
            UIView.animate(withDuration: 0.4, animations: {
                self.playerView.frame = frameInView
                self.playerView.layoutIfNeeded()
            }) { _ in
                self.playerView.removeFromSuperview()
            }
        }
    }

    
    func play(_ url: URL) {
        let player = AVPlayer(url: url)
        playerView.player = player
        playerView.play()
    }
    
    func playWithDefalut(_ url: URL) {
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        present(playerViewController, animated: true, completion: nil)
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

extension OperationViewController: AddVideoSnippetProtocol {
    func addVideoSnippet(snippet: SnippetModel) {
        snippets.append(snippet)
        DispatchQueue.main.async {
            self.snippetCollection.reloadData()
        }
    }
}

extension OperationViewController: ControllerDispatchProtocol {
    
    func controllerWillShow() {
        
    }
    
    func controllerWillHide() {
        
    }
}
