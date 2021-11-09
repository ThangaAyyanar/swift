import Foundation

//Linked List

class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T) {
        self.data = data
    }
}

class LinkedList<T> {
    
    private var head: Node<T>?
    private var tail: Node<T>?
    public var count: Int = 0
    
    func add(data: T) {
        
        let newNode = Node<T>(data: data)
        if head == nil {
            head = newNode
        }
        else if let tailNode = tail{
            tailNode.next = newNode
        }
        tail = newNode
        count += 1
    }
    
    func modify(at index: Int,with data: T) {
        
        guard index >= 0, head != nil else { return }
        
        var localIndex = 0;
        var tempHead = head
        
        while tempHead != nil {
            if localIndex == index {
                tempHead?.data = data
            }
            localIndex += 1
            tempHead = tempHead?.next
        }
    }
    
    func remove(at index: Int) {
        
        guard index >= 0, head != nil else { return }
        
        var localIndex = 0;
        var tempHead = head
        var prevNode: Node<T>? = nil
        
        while tempHead != nil {
            if localIndex == index {
                if prevNode == nil {
                    if tempHead?.next == nil {
                        head = nil
                        tail = nil
                    }
                    else {
                        head = tempHead?.next
                    }
                }
                else if tempHead?.next == nil {
                    prevNode?.next = nil
                    tail = prevNode
                }
                else {
                    prevNode?.next = tempHead?.next
                }
                count -= 1
            }
            localIndex += 1
            prevNode = tempHead
            tempHead = tempHead?.next
        }
    }
    
    func DebugList() {
        var tempHead = head
        print("[ ", terminator: "")
        while tempHead != nil {
            print("\(tempHead!.data)",terminator: " ")
            tempHead = tempHead?.next
        }
        print("]")
        print("Number of Elements: \(count)")
    }
}

class LinkedListTestInteger {
    
    // Creation
    
    func linkedListCreation() {
        
        let linkedList = LinkedList<Int>()
        linkedList.add(data: 5)
        linkedList.add(data: 6)
        linkedList.add(data: 7)
        
        print(linkedList.DebugList())
    }
    
    // Modification
    
    func linkedListModify_AtHead() {
        let linkedList = LinkedList<Int>()
        linkedList.add(data: 5)
        linkedList.add(data: 6)
        linkedList.add(data: 7)
        
        linkedList.modify(at: 0, with: 8)
        
        print(linkedList.DebugList())
    }
    
    func linkedListModify_AtTail() {
        let linkedList = LinkedList<Int>()
        linkedList.add(data: 5)
        linkedList.add(data: 6)
        linkedList.add(data: 7)
        
        linkedList.modify(at: 2, with: 8)
        
        print(linkedList.DebugList())
    }
    
    func linkedListModify_AtMid() {
        let linkedList = LinkedList<Int>()
        linkedList.add(data: 5)
        linkedList.add(data: 6)
        linkedList.add(data: 7)
        
        linkedList.modify(at: 1, with: 8)
        
        print(linkedList.DebugList())
    }
    
    // Removal
    
    func linkedListRemoval_AtHead() {
        let linkedList = LinkedList<Int>()
        linkedList.add(data: 5)
        linkedList.add(data: 6)
        linkedList.add(data: 7)
        
        linkedList.remove(at: 0)
        
        print(linkedList.DebugList())
    }
    
    func linkedListRemoval_AtTail() {
        let linkedList = LinkedList<Int>()
        linkedList.add(data: 5)
        linkedList.add(data: 6)
        linkedList.add(data: 7)
        
        linkedList.remove(at: 2)
        
        print(linkedList.DebugList())
    }
    
    func linkedListRemoval_AtMid() {
        let linkedList = LinkedList<Int>()
        linkedList.add(data: 5)
        linkedList.add(data: 6)
        linkedList.add(data: 7)
        
        linkedList.remove(at: 1)
        
        print(linkedList.DebugList())
    }
    
    func linkedListRemoval_all() {
        let linkedList = LinkedList<Int>()
        linkedList.add(data: 7)
        
        linkedList.remove(at: 0)
        
        print(linkedList.DebugList())
    }
    
    // All operation test
    
    func linkedListAllOperation() {
        
        let linkedList = LinkedList<Int>()
        linkedList.add(data: 5)
        linkedList.add(data: 6)
        linkedList.add(data: 7)
        print("Adding: ")
        print(linkedList.DebugList())
        linkedList.modify(at: 1, with: 8)
        print("Modified: ")
        print(linkedList.DebugList())
        linkedList.remove(at: 0)
        print("Removal: ")
        print(linkedList.DebugList())
    }
}


class LinkedListTestString {
    
    // Creation
    
    func linkedListCreation() {
        
        let linkedList = LinkedList<String>()
        linkedList.add(data: "Hello")
        linkedList.add(data: "World")
        linkedList.add(data: "Swift")
        
        print(linkedList.DebugList())
    }
    
    // Modification
    
    func linkedListModify_AtHead() {
        let linkedList = LinkedList<String>()
        linkedList.add(data: "Hello")
        linkedList.add(data: "World")
        linkedList.add(data: "Swift")
        
        linkedList.modify(at: 0, with: "Vanakam")
        
        print(linkedList.DebugList())
    }
    
    func linkedListModify_AtTail() {
        let linkedList = LinkedList<String>()
        linkedList.add(data: "Hello")
        linkedList.add(data: "World")
        linkedList.add(data: "Swift")
        
        linkedList.modify(at: 2, with: "iOS")
        
        print(linkedList.DebugList())
    }
    
    func linkedListModify_AtMid() {
        let linkedList = LinkedList<String>()
        linkedList.add(data: "Hello")
        linkedList.add(data: "World")
        linkedList.add(data: "Swift")
        
        linkedList.modify(at: 1, with: "Ulagam")
        
        print(linkedList.DebugList())
    }
    
    // Removal
    
    func linkedListRemoval_AtHead() {
        let linkedList = LinkedList<String>()
        linkedList.add(data: "Hello")
        linkedList.add(data: "World")
        linkedList.add(data: "Swift")
        
        linkedList.remove(at: 0)
        
        print(linkedList.DebugList())
    }
    
    func linkedListRemoval_AtTail() {
        let linkedList = LinkedList<String>()
        linkedList.add(data: "Hello")
        linkedList.add(data: "World")
        linkedList.add(data: "Swift")
        
        linkedList.remove(at: 2)
        
        print(linkedList.DebugList())
    }
    
    func linkedListRemoval_AtMid() {
        let linkedList = LinkedList<String>()
        linkedList.add(data: "Hello")
        linkedList.add(data: "World")
        linkedList.add(data: "Swift")
        
        linkedList.remove(at: 1)
        
        print(linkedList.DebugList())
    }
    
    func linkedListRemoval_all() {
        let linkedList = LinkedList<String>()
        linkedList.add(data: "Hello")
        
        linkedList.remove(at: 0)
        
        print(linkedList.DebugList())
    }
    
    // All operation test
    
    func linkedListAllOperation() {
        
        let linkedList = LinkedList<String>()
        linkedList.add(data: "Hello")
        linkedList.add(data: "World")
        linkedList.add(data: "Swift")
        print("Adding: ")
        print(linkedList.DebugList())
        linkedList.modify(at: 1, with: "Ulagam")
        print("Modified: ")
        print(linkedList.DebugList())
        linkedList.remove(at: 0)
        print("Removal: ")
        print(linkedList.DebugList())
    }
}
