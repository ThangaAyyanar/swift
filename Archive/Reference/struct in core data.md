# using the struct in core data 

```
extension StructDecoder {
    func toCoreData(context: NSManagedObjectContext) throws -> NSManagedObject {
	let entityName = self.dynamicType.EntityName

	// Create the Entity Description
	guard let desc = NSEntityDescription.entityForName(entityName, inManagedObjectContext: context)
	    else { throw UnknownEntity(name: entityName) }

	// Create the NSManagedObject
	let managedObject = NSManagedObject(entity: desc, insertIntoManagedObjectContext: context)

	// Create a Mirror
	let mirror = Mirror(reflecting: self)

	// Make sure we're analyzing a struct
	guard mirror.displayStyle == .Struct else { throw SerializationError.StructRequired }

	for case let (label?, anyValue) in mirror.children {
	    if let value = anyValue as? AnyObject {
		managedObject.setValue(child, forKey: label)
	    } else {
		throw SerializationError.UnsupportedSubType(label: label)
	    }
	}

	return managedObject
    }
}

```

URL : https://appventure.me/2015/10/24/swift-reflection-api-what-you-can-do/

