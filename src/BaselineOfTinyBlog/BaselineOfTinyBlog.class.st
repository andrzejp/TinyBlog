Class {
	#name : #BaselineOfTinyBlog,
	#superclass : #BaselineOf,
	#category : #BaselineOfTinyBlog
}

{ #category : #baselines }
BaselineOfTinyBlog >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Packages" spec package: 'TinyBlog' ]
]
