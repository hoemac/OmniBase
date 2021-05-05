Extension { #name : #ZnEncodedStream }

{ #category : #'*OmniBase' }
ZnEncodedStream >> lock: aBoolean for: length [
"migrate to Pharo 7 FileStreams. This extension was implemented in class StandardFileStream before"
	self odbToDo.
	^ true
]
