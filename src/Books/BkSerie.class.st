"
a comment
"
Class {
	#name : #BkSerie,
	#superclass : #BkElement,
	#instVars : [
		'books'
	],
	#category : #'Books-Model'
}

{ #category : #accessing }
BkSerie >> books [
	^ books
]

{ #category : #accessing }
BkSerie >> children [

	^ books
]

{ #category : #'instance creation' }
BkSerie >> fromDList: aDList [

	super fromDList: aDList.
	books := aDList rest collect: [ :each | BkBook fromDList: each ]
]
