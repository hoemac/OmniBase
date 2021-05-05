Extension { #name : #ZnEncodedWriteStream }

{ #category : #'*OmniBase' }
ZnEncodedWriteStream class >> fileNamed: fileName [

^fileName asFileReference writeStream 
]

{ #category : #'*OmniBase' }
ZnEncodedWriteStream class >> forceNewFileNamed: fileName [

	^ fileName asFileReference
		  ensureDelete;
		  writeStream
]

{ #category : #'*OmniBase' }
ZnEncodedWriteStream class >> newFileNamed: fileName [

	| fileRef |
	fileRef := fileName asFileReference.
	fileRef exists ifTrue:[FileExists signalWith: fileRef].
	^fileRef writeStream
]

{ #category : #'*OmniBase' }
ZnEncodedWriteStream class >> oldFileNamed: fileName [

	| fileRef |
	fileRef := fileName asFileReference.
	fileRef exists ifFalse: [ 
		^ (FileDoesNotExistException fileName: fileName) signal ].
	^ fileRef writeStream
]

{ #category : #'*OmniBase' }
ZnEncodedWriteStream >> writeFrom: aString startingAt: startIndex for: anInteger [

	"Store the next anInteger elements from the given collection."

   "migrate to Pharo 7 FileStreams. This extension was implemented in class StandardFileStream before. Old implementation:"
	"	rwmode
		ifFalse: [ ^ self error: 'Cannot write a read-only file' ].
	^ self
		primWrite: fileID
		from: aString
		startingAt: startIndex
		count: anInteger"

	^self next: anInteger putAll: aString startingAt: startIndex
]
