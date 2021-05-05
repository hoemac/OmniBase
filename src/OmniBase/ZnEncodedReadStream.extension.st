Extension { #name : #ZnEncodedReadStream }

{ #category : #'*OmniBase' }
ZnEncodedReadStream >> readInto: aString startingAt: startIndex for: n [

	"Read n bytes into the given string."

	"migrate to Pharo 7 FileStreams. This extension was implemented in class StandardFileStream before. Old implementation:"
	"^self primRead: fileID into: aString startingAt: startIndex count: n."

	^ self next: n into: aString startingAt: startIndex
]
