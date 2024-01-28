Class {
	#name : #TBApplicationRootComponent,
	#superclass : #WAComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #testing }
TBApplicationRootComponent class >> canBeRoot [

	^ true
]

{ #category : #'class initialization' }
TBApplicationRootComponent class >> initialize [
	"self initialze"

	| app |
	app := WAAdmin register: self asApplicationAt: 'TinyBlog'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary
]

{ #category : #rendering }
TBApplicationRootComponent >> renderContentOn: html [
html text: 'TinyBlog'
]

{ #category : #updating }
TBApplicationRootComponent >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'TinyBlog'
]
