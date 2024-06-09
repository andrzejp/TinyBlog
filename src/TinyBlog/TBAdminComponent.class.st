Class {
	#name : 'TBAdminComponent',
	#superclass : 'TBScreenComponent',
	#category : 'TinyBlog-Components',
	#package : 'TinyBlog',
	#tag : 'Components'
}

{ #category : 'rendering' }
TBAdminComponent >> renderContentOn: html [

	super renderContentOn: html.
	html container: [
		html heading: 'Blog Admin'.
		html horizontalRule ]
]
