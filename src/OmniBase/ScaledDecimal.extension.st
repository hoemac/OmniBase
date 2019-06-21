Extension { #name : #ScaledDecimal }

{ #category : #'*omnibase' }
ScaledDecimal >> odbBasicSerialize: serializer [
	serializer stream
		putByte: 46;
		putInteger: numerator;
		putInteger: denominator;
		putInteger: scale
]

{ #category : #'*OmniBase' }
ScaledDecimal class >> odbDeserialize: deserializer [
	^ self newFromNumber: (super odbDeserialize: deserializer) scale: deserializer stream getInteger
	
	
	
]

{ #category : #'*omnibase' }
ScaledDecimal >> odbSerialize: serializer [
	self odbBasicSerialize: serializer 
]
