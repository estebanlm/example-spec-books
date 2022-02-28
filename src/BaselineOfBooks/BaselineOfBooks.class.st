Class {
	#name : #BaselineOfBooks,
	#superclass : #BaselineOf,
	#category : #BaselineOfBooks
}

{ #category : #baselines }
BaselineOfBooks >> baseline: spec [
	<baseline>
	
	spec for: #common do: [
		self specGtk: spec. 
		self magritte: spec.
		spec package: 'Books' ]
]

{ #category : #'external projects' }
BaselineOfBooks >> magritte: spec [

	spec
		baseline: 'Magritte'
		with: [ 
			spec 
				repository: 'github://estebanlm/magritte:magritte-spec/source';
				loads: #('Core' 'Spec') ]
]

{ #category : #'external projects' }
BaselineOfBooks >> specGtk: spec [

	spec
		baseline: 'SpecGtk'
		with: [ spec repository: 'github://pharo-spec/Spec-Gtk/src' ]
]
