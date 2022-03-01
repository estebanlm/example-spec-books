"
a comment
"
Class {
	#name : #BkAuthor,
	#superclass : #BkElement,
	#instVars : [
		'series'
	],
	#category : #'Books-Model'
}

{ #category : #testing }
BkAuthor class >> isVoyageRoot [

	^ true
]

{ #category : #accessing }
BkAuthor >> children [

	^ series
]

{ #category : #'instance creation' }
BkAuthor >> fromDList: aDList [

	super fromDList: aDList.
	series := aDList rest collect: [ :each | BkSerie fromDList: each ]	

]

{ #category : #accessing }
BkAuthor >> numberOfBooks [
	
	^ (series flatCollect: #books) size
]
