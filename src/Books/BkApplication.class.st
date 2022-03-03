Class {
	#name : #BkApplication,
	#superclass : #SgaApplication,
	#instVars : [
		'collection',
		'repository'
	],
	#category : #'Books-View'
}

{ #category : #activation }
BkApplication class >> applicationName [

	^ 'books'
]

{ #category : #accessing }
BkApplication >> collection [

	^ (self repository selectAll: BkCollection) anyOne
]

{ #category : #initialization }
BkApplication >> initialize [

	super initialize.
	self useBackend: #Gtk.
]

{ #category : #private }
BkApplication >> openRepository [

	^ VoEJDBRepository on: './books.edb' asFileReference
]

{ #category : #accessing }
BkApplication >> repository [

	^ repository ifNil: [ repository := self openRepository ]
]

{ #category : #accessing }
BkApplication >> start [ 

	(BkCollectionPresenter 
		newApplication: self 
		model: self collection)
		open
]
