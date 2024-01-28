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
			with: 'TinyBlog' ]
]

{ #category : #rendering }
TBHeaderComponent >> renderContentOn: html [

	html
		navigationBar;
		with: [ self renderBrandOn: html ]
]
