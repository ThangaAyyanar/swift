enum BinaryTree<T>{
    indirect case node(left:BinaryTree<T>,T,right:BinaryTree<T>)
    case empty
    
    var count: Int {
        
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count // 1 to count the current node
        default:
            return 0
        }
    }
    
}

extension BinaryTree: CustomStringConvertible {
    
    var description: String {
        
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [\(left.description)], right = [\(right.description)]"
        default:
            return ""
        }
    }
}

/*
 There are three ways to traverse a binary tree:
 
 1.In-order (or depth-first): first look at the left child of a node, then at the node itself, and finally at its right child.
 2.Pre-order: first look at a node, then at its left and right children.
 3.Post-order: first look at the left and right children and process the node itself last.

 */

extension BinaryTree {
    
    func inOrderTravasal(process: (T) -> Void) {
        
        if case let .node(left, value, right) = self {
            left.inOrderTravasal(process: process)
            process(value)
            right.inOrderTravasal(process: process)
        }
    }
    
    func preOrderTravasal(process: (T) -> Void) {
        
        if case let .node(left, value, right) = self {
            process(value)
            left.preOrderTravasal(process: process)
            right.preOrderTravasal(process: process)
        }
    }
    
    func postOrderTravasal(process: (T) -> Void) {
        
        if case let .node(left, value, right) = self {
            left.postOrderTravasal(process: process)
            right.postOrderTravasal(process: process)
            process(value)
        }
    }
}


// leaf nodes
let node5 = BinaryTree.node(left:.empty, "5", right:.empty)
let nodeA = BinaryTree.node(left:.empty, "a", right:.empty)
let node10 = BinaryTree.node(left:.empty, "10",right: .empty)
let node4 = BinaryTree.node(left:.empty, "4",right: .empty)
let node3 = BinaryTree.node(left:.empty, "3",right: .empty)
let nodeB = BinaryTree.node(left:.empty, "b",right: .empty)

// intermediate nodes on the left
let Aminus10 = BinaryTree.node(left:nodeA, "-", right: node10)
let timesLeft = BinaryTree.node(left:node5, "*", right: Aminus10)

// intermediate nodes on the right
let minus4 = BinaryTree.node(left:.empty, "-", right: node4)
let divide3andB = BinaryTree.node(left:node3, "/", right: nodeB)
let timesRight = BinaryTree.node(left:minus4, "*", right: divide3andB)

// root node
let tree = BinaryTree.node(left: timesLeft, "+", right:timesRight)

print(tree)

let printTree:((String) -> Void) = { (data) -> Void in
    print(data)
}
print("In order travasal : \n")

tree.inOrderTravasal(process:printTree)

print("Pre order travasal : \n")

tree.preOrderTravasal(process: printTree)

print("Post order travasal : \n")

tree.postOrderTravasal(process: printTree)

