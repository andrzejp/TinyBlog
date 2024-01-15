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
		self seaside: spec.

		"Packages"
		spec package: 'TinyBlog' ]
]

{ #category : #'as yet unclassified' }
BaselineOfTinyBlog >> seaside: spec [

	spec
		baseline: 'Seaside3'
		with: [
		spec repository: 'github://SeasideSt/Seaside:master/repository' ]
]

{ #category : #'as yet unclassified' }
BaselineOfTinyBlog >> voyage: spec [

	spec baseline: 'Voyage' with: [
		spec
			loads: #( 'mongo' 'memory' );
			repository: 'github://pharo-nosql/voyage/mc' ]
]
