Class {
	#name : 'TBHeaderComponent',
	#superclass : 'WAComponent',
	#category : 'TinyBlog-Components',
	#package : 'TinyBlog',
	#tag : 'Components'
}

{ #category : 'rendering' }
TBHeaderComponent >> renderBrandOn: html [

	html navigationBar: [
		html navigationBarBrand
			url: self application url;
			with: TBBlog current name ]
]

{ #category : 'rendering' }
TBHeaderComponent >> renderButtonsOn: html [

	self renderSimpleAdminButtonOn: html
]

{ #category : 'rendering' }
TBHeaderComponent >> renderContentOn: html [

	html
		navigationBar;
		beLight;
		with: [
			html container: [
					self renderBrandOn: html.
					self renderButtonsOn: html ] ]
]

{ #category : 'rendering' }
TBHeaderComponent >> rendererClass [

	^ SBSHtmlCanvas
]
