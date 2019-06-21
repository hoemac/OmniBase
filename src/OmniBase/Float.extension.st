Extension { #name : #Float }

{ #category : #'*omnibase' }
Float >> asBtreeKeyOfSize: keySize [

	^ self asIEEE32BitWord asBtreeKeyOfSize: keySize
]

{ #category : #'*omnibase' }
Float class >> odbDeserialize: deserializer [
	"The * 1 is here to give a chance to the VM to create a SmallFloat64 if it can "

	^ BoxedFloat64  basicNew
		at: 1 put: deserializer stream getInteger;
		at: 2 put: deserializer stream getInteger;
		* 1
]
