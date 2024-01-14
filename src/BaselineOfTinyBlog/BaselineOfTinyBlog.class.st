Class {
	#name : #BaselineOfTinyBlog,
	#superclass : #BaselineOf,
	#category : #BaselineOfTinyBlog
}

{ #category : #baselines }
BaselineOfTinyBlog >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Dependencies"
		self voyage: spec.

		"Packages"
		spec package: 'TinyBlog' ]
]

{ #category : #'as yet unclassified' }
BaselineOfTinyBlog >> voyage: spec [

	spec baseline: 'Voyage' with: [
		spec
			loads: #( 'mongo' 'memory' );
			repository: 'github://pharo-nosql/voyage/mc' ]
]
