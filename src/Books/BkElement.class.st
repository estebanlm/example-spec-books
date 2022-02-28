"
a comment
"
Class {
	#name : #BkElement,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Books-Model'
}

{ #category : #'instance creation' }
BkElement class >> fromDList: aDList [ 

	^ self new fromDList: aDList
]

{ #category : #accessing }
BkElement >> children [

	^ #()
]

{ #category : #'instance creation' }
BkElement >> fromDList: aDList [

	name := aDList value

]

{ #category : #accessing }
BkElement >> name [

	^ name
]

{ #category : #printing }
BkElement >> printOn: stream [

	stream << self name
]
