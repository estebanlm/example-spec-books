"
a comment
"
Class {
	#name : #BkCollection,
	#superclass : #BkElement,
	#instVars : [
		'authors'
	],
	#category : #'Books-Model'
}

{ #category : #testing }
BkCollection class >> isVoyageRoot [

	^ true
]

{ #category : #authors }
BkCollection >> authors [
	^ authors
]

{ #category : #accessing }
BkCollection >> children [

	^ authors
]

{ #category : #'instance creation' }
BkCollection >> fromDList: aDList [

	super fromDList: aDList.
	authors := aDList rest collect: [ :each | BkAuthor fromDList: each ]
	
]
