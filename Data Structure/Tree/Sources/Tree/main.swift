
class Tree<Element> {
    
    private var data: Element
    
    private weak var parent: Tree<Element>?
    var childrens: [Tree<Element>] = []
    
    init(value: Element) {
        
        self.data = value
    }
    
    func addChild(_ node: Tree<Element>) {
        
        childrens.append(node)
        node.parent = self
    }
    
    func printTree() {
        
        printNode(node: self)
    }
    
    private func printNode(node: Tree<Element>?) {
        
        if let node = node {
            
            print("\(node.data)", terminator: "{")
        
            for children in node.childrens{
                
                printNode(node: children)
                print(",", terminator: "")
            }
            
            print("}", terminator: "")
        }
    }
}

extension Tree where Element: Equatable {
    
    func search(_ value: Element) {
        
        if value == self.data {
            
            printNode(node: self)
        }
        for child in childrens {
            
            child.search(value)
        }
    }
}

let tree = Tree<String>(value: "beverages")

let hotNode = Tree<String>(value: "hot")
let coldNode = Tree<String>(value: "cold")

let teaNode = Tree<String>(value: "tea")
let coffeeNode = Tree<String>(value: "coffee")
let chocolateNode = Tree<String>(value: "cocoa")

let blackTeaNode = Tree<String>(value: "black")
let greenTeaNode = Tree<String>(value: "green")
let chaiTeaNode = Tree<String>(value: "chai")

let sodaNode = Tree<String>(value: "soda")
let milkNode = Tree<String>(value: "milk")

let gingerAleNode = Tree<String>(value: "ginger ale")
let bitterLemonNode = Tree<String>(value: "bitter lemon")

tree.addChild(hotNode)
tree.addChild(coldNode)

hotNode.addChild(teaNode)
hotNode.addChild(coffeeNode)
hotNode.addChild(chocolateNode)

coldNode.addChild(sodaNode)
coldNode.addChild(milkNode)

teaNode.addChild(blackTeaNode)
teaNode.addChild(greenTeaNode)
teaNode.addChild(chaiTeaNode)

sodaNode.addChild(gingerAleNode)
sodaNode.addChild(bitterLemonNode)

tree.search("hot")
//tree.printTree()
