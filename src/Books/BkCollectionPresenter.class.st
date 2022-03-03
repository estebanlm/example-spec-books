Class {
	#name : #BkCollectionPresenter,
	#superclass : #SpPresenter,
	#traits : 'SpTModel',
	#classTraits : 'SpTModel classTrait',
	#instVars : [
		'tree',
		'detail',
		'toolbar'
	],
	#category : #'Books-View'
}

{ #category : #actions }
BkCollectionPresenter >> doShowStatistics [
		
	"(BkStatisticsPresenter 
		newApplication: self application 
		model: self model)
		open"
]

{ #category : #initialization }
BkCollectionPresenter >> initializePresenters [

	self layout: (SpBoxLayout newLeftToRight
		add: (tree := self newTree);
		add: (detail := self newPresenter);
		yourself).
	
	tree 
		display: [ :aNode | aNode name ];
		children: [ :aNode | aNode children ].

	tree transmitDo: [ :aNode |
		| newPresenter |
		newPresenter := aNode asMagritteSpecPresenter.
		self layout 
			replace: detail 
			with: newPresenter.
		detail := newPresenter ]
]

{ #category : #initialization }
BkCollectionPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'My Collections'";
		toolbar: self toolbar"
]

{ #category : #initialization }
BkCollectionPresenter >> toolbar [

	^ toolbar ifNil: [ 
		toolbar := self newToolbar
			add: (self newToolbarButton 
				icon: (self iconNamed: #paint);
				label: 'Stats';
				action: [ self doShowStatistics ];
				yourself);
			yourself ]
]

{ #category : #initialization }
BkCollectionPresenter >> updatePresenter [

	tree roots: { self model }.
]
