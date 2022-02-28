"
a comment
"
Class {
	#name : #BkBook,
	#superclass : #BkElement,
	#instVars : [
		'read',
		'style',
		'summary',
		'price',
		'number',
		'comments',
		'part',
		'condition',
		'format',
		'originalTitle',
		'year'
	],
	#category : #'Books-Model'
}

{ #category : #testing }
BkBook class >> isVoyageRoot [

	^ true
]

{ #category : #accessing }
BkBook >> comments [

	^ comments
]

{ #category : #accessing }
BkBook >> comments: anObject [

	comments := anObject
]

{ #category : #accessing }
BkBook >> condition [

	^ condition
]

{ #category : #accessing }
BkBook >> condition: anObject [

	condition := anObject
]

{ #category : #descriptions }
BkBook >> descriptionOriginalTitle [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 15;
		label: 'Original Title';
		accessor: #originalTitle;
		yourself
]

{ #category : #descriptions }
BkBook >> descriptionRead [
	<magritteDescription>
	
	^ MABooleanDescription new
		priority: 40;
		label: 'Read';
		accessor: #read;
		yourself
]

{ #category : #descriptions }
BkBook >> descriptionStyle [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 18;
		label: 'Style';
		accessor: #style;
		yourself
]

{ #category : #descriptions }
BkBook >> descriptionSummary [
	<magritteDescription>
	
	^ MAMemoDescription new
		priority: 30;
		label: 'Summary';
		accessor: #summary;
		yourself
]

{ #category : #descriptions }
BkBook >> descriptionTitle [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 10;
		label: 'Title';
		accessor: #name;
		yourself
]

{ #category : #accessing }
BkBook >> format [

	^ format
]

{ #category : #accessing }
BkBook >> format: anObject [

	format := anObject
]

{ #category : #'instance creation' }
BkBook >> fromDList: aDList [

	super fromDList: aDList.
	aDList rest do: [ :each |
		self perform: each key asSymbol asMutator with: each value ]
]

{ #category : #testing }
BkBook >> isRead [

	^ read == true
]

{ #category : #accessing }
BkBook >> number [

	^ number
]

{ #category : #accessing }
BkBook >> number: anObject [

	number := anObject
]

{ #category : #accessing }
BkBook >> originalTitle [

	^ originalTitle
]

{ #category : #accessing }
BkBook >> originalTitle: anObject [

	originalTitle := anObject
]

{ #category : #accessing }
BkBook >> part [

	^ part
]

{ #category : #accessing }
BkBook >> part: anObject [

	part := anObject
]

{ #category : #accessing }
BkBook >> price [

	^ price
]

{ #category : #accessing }
BkBook >> price: anObject [

	price := anObject
]

{ #category : #accessing }
BkBook >> read [

	^ read == true
]

{ #category : #accessing }
BkBook >> read: anObject [

	read := anObject == true or: [ anObject = 'true' ]
]

{ #category : #testing }
BkBook >> style [

	^ style
]

{ #category : #accessing }
BkBook >> style: anObject [

	style := anObject
]

{ #category : #testing }
BkBook >> summary [

	^ summary
]

{ #category : #accessing }
BkBook >> summary: anObject [

	summary := anObject
]

{ #category : #accessing }
BkBook >> year [

	^ year
]

{ #category : #accessing }
BkBook >> year: anObject [

	year := anObject
]
