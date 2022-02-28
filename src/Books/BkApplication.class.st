"
a comment
"
Class {
	#name : #BkApplication,
	#superclass : #SpApplication,
	#category : #'Books-View'
}

{ #category : #accessing }
BkApplication >> activeCollection [
	| dlist |

	dlist := DLittleLParser parse: ('./books.dl' asFileReference contents).
	^ BkCollection fromDList: dlist
]

{ #category : #initialization }
BkApplication >> initialize [

	super initialize.
	self useBackend: #Gtk
]

{ #category : #running }
BkApplication >> start [ 

	(BkCollectionPresenter 
		newApplication: self
		model: self activeCollection) 
		open
]
