Class {
	#name : #TBHeaderComponent,
	#superclass : #WAComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBHeaderComponent >> renderBrandOn: html [

	html navigationBar: [
		html navigationBarBrand
			url: self application url;
			with: TBBlog current name ]
]

{ #category : #rendering }
TBHeaderComponent >> renderContentOn: html [

	| bar |
	bar := html navigationBar.
	bar background beLight.
	bar with: [ html container: [ self renderBrandOn: html ] ]
]

{ #category : #rendering }
TBHeaderComponent >> rendererClass [

	^ SBSHtmlCanvas
]
