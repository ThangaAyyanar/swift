
// Simple Linked list implementation

class LinkedList{
    
    class List{
        
        var data:Int
        weak var next:List?
        
        init(data:Int) {
            
            self.data = data
        }
    }
    
    var head:List?
    
    var isEmpty:Bool {
        return head != nil
    }
    
    var tail:List? {
        
        guard var node = head else {
    
            return nil
        }
        
        while let temp = node.next {
            node = temp
        }
        return node
    }
    
    var count:Int {
        
        guard var node = head else {
            
            return 0
        }
        
        var count = 1
        while let temp = node.next {
        
            node = temp
            count += 1
        }
        return count
    }
    
    func listAt(index:Int) -> List {
        
        if index == 0{
            return head!
        }
        else{
            
            var count = 1
            var node = head!
            while index != count,
                  let temp = node.next{
                    
                node = temp
                count += 1
            }
            return node
        }
    }
    
    subscript(index:Int) -> List {

        return listAt(index: index)
    }
    
    func insertAt(index:Int,data:Int) {
        
        let newList = List(data: data)
        
        if index > count {
            
            print("Given Index is greater than count so appending to the list")
            append(newData: data)
        }
        else if index - 1 > 0 {
        
            let currentNode = listAt(index: index - 1)
            let nextNode = listAt(index: index)
            
            currentNode.next = newList
            newList.next = nextNode
        }
        else if index == 0 {
            
            newList.next = head
            head = newList
        }
        
    }
    
    func deleteAt(index:Int) {
        
        if index - 1 > 0 && index + 1 < count {
            
            var previousNode = listAt(index: index - 1)
            let nextNode = listAt(index: index + 1)
            previousNode.next = nextNode
        }
        else if index == 0 {
            
            head = nil
        }
        else if index > 0 && index == count - 1 {
            
            var previousNode = listAt(index: index - 1)
            previousNode.next = nil
        }
        else {
            
            print("No elements in Linked List")
        }
    }
    
    func append(newData: Int){
        
        let list = List(data: newData)
        
        if var node = tail {
            
            node.next = list
        }
        else{
            head = list
        }
    }
    
}

