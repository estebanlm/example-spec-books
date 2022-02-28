Class {
	#name : #BkStatisticsPresenter,
	#superclass : #SpPresenter,
	#traits : 'SpTModel',
	#classTraits : 'SpTModel classTrait',
	#instVars : [
		'droplist',
		'packages',
		'totalSum',
		'chart',
		'pie'
	],
	#category : #'Books-View'
}

{ #category : #authors }
BkStatisticsPresenter >> authors [

	^ self model authors
]

{ #category : #initialization }
BkStatisticsPresenter >> initializePresenters [
	
	self layout: (SpBoxLayout newTopToBottom
		add: (chart := self instantiate: SpRoassalPresenter);
		yourself).
	
	chart script: [ :view | 
		self visualizePie: view ]
]

{ #category : #initialization }
BkStatisticsPresenter >> visualizeChart: canvas package: pkg [
	| generator result ticks scale bscale canvasRect box |
	generator := RSLabelGenerator new.
	generator setLooseFlag: true.
	result := generator searchMin: 0 max: totalSum desired: 10.
	ticks := result min to: result max by: result step.
	canvasRect := Rectangle
		floatCenter: 0@0
		extent: canvas extent * 0.9.
	scale := NSScale linear
		domain: {result min. result max};
		range: {canvasRect bottom. canvasRect top }.
	bscale := NSScale linear
		domain: { 0. totalSum };
		range: { 0. canvasRect height }.
	
	box := RSBox new
		color: Color lightGray;
		extent: 20@ (bscale scale: pkg linesOfCode);
		yourself.
	box position: -10 @ ((scale scale: 0) - (box height /2 )).
	canvas add: box.
	canvas addAll: (ticks collect:[:t | 
		RSLabel new
			position: 20@ (scale scale: t);
			text: (t >= 1000
				ifTrue: [ ((t / 1000) printShowingDecimalPlaces: 1) ,'K' ]
				ifFalse: [ t asInteger asString ]);
			yourself ]).
	
	canvas add: (RSPolyline new
		controlPoints: (ticks collect: [:p | -10 @ (scale scale: p)]);
		marker: (RSBox new extent: 10@2; color: Color black);
		yourself)
]

{ #category : #initialization }
BkStatisticsPresenter >> visualizePie: canvas [
	| b rect max |
	
	b := RSPie new.
	b container: canvas.
	
	b sliceShape
		innerRadius: 70;
		externalRadius: 150;
		segmentSpacing: 0.1.
	b sliceColor: NSScale google20.
	b 
		objects: (self authors sorted: #numberOfBooks ascending);
		slice: #numberOfBooks;
		build.
	
	RSRotatedPieLabelDecorator on: b.
	b shapes @ (RSPopup text: [ :author | 
		author name, String cr, author numberOfBooks asString, ' books' ] ).
	canvas addShape: (RSLabel new
		text: 'Books by author').
	rect := canvas encompassingRectangle.
	max := rect origin x abs max: rect corner x.
	canvas when: RSExtentChangedEvent do: [ 
		canvas camera 
			zoomToFit: canvas extent 
			rectangle: (Rectangle floatCenter: 0@0 extent: max * 2@0).
		canvas signalUpdate ]
]
