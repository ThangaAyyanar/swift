
class Queue<Element> {
    
    private class Node<Element> {
        
        var data: Element
        var next: Node?
        
        init(data:Element) {
            
            self.data = data
        }
    }
    
    private var head: Node<Element>?
    
    private var tail: Node<Element>? {
        
        if head == nil {
            
            return nil
        }
        else{
            
            var temp = head!
            while temp.next != nil {
                
                temp = temp.next!
            }
            return temp
        }
    }
    
    func enqueue(data: Element) {
        
        let newNode = Node(data: data)
        
        if head == nil {
            
            head = newNode
        }
        else{
            
            tail!.next = newNode
        }
    }
    
    func dequeue() -> Element? {
        
        if head != nil{
            
            let data = head!.data
            head = head!.next
            return data
        }
        return nil
    }
    
    func queueList() {
        
        var tempQueue = head
        while tempQueue != nil {
            
            print("\(tempQueue!.data) \t")
            tempQueue = tempQueue!.next
        }
    }
}

let intQueue = Queue<Int>()
intQueue.enqueue(data: 12)
intQueue.enqueue(data: 13)

intQueue.queueList()

intQueue.dequeue()
intQueue.dequeue()

intQueue.queueList()
