import Foundation

class MainScene: CCNode {
    var _start: CCNode!
    var _node1: CCNode!
    var _node2: CCNode!
    var _node3: CCNode!
    var _node4: CCNode!
    var _node5: CCNode!
    var _node6: CCNode!
    var _node7: CCNode!
    var _node8: CCNode!
    var nodes = Array<CCNode>();
    var actions = Array<CCAction>();
    
    var movementSpeed = 1;
    var doOnce = true
    
    override init() {
        super.init();
    }
    
    func didLoadFromCCB() {
        //self.userInteractionEnabled = true
        nodes = [_node1, _node2, _node3, _node4, _node5, _node6, _node7, _node8]
    }
    
    func runSequence(forNode:CCNode,delta:CCTime) {
        for node in nodes {
            var movingAction: CCActionMoveTo = CCActionMoveTo(duration: CCTime(movementSpeed) + delta, position: node.position)
            actions.append(movingAction)
        }
        forNode.runAction(CCActionSequence.actionWithArray(actions) as CCActionSequence)
    }
    
    override func touchBegan(touches: CCTouch, withEvent event: CCTouchEvent) {
        
    }
    
    override func update(delta: CCTime) {
        if (doOnce) {
            runSequence(_start, delta: delta)
            doOnce = false
        }

    }
}
