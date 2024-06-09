Class {
	#name : 'TBPostsListComponent',
	#superclass : 'TBScreenComponent',
	#instVars : [
		'currentCategory'
	],
	#category : 'TinyBlog-Components',
	#package : 'TinyBlog',
	#tag : 'Components'
}

{ #category : 'accessing' }
TBPostsListComponent >> currentCategory [

	^ currentCategory
]

{ #category : 'accessing' }
TBPostsListComponent >> currentCategory: anObject [

	currentCategory := anObject
]

{ #category : 'as yet unclassified' }
TBPostsListComponent >> readSelectedPosts [

	^ self currentCategory
		  ifNil: [ self blog allVisibleBlogPosts ]
		  ifNotNil: [
		  self blog allVisibleBlogPostsFromCategory: self currentCategory ]
]

{ #category : 'rendering' }
TBPostsListComponent >> renderContentOn: html [

	super renderContentOn: html.
	html container: [
		html row with: [
			html column
				extraSmallSize: 12;
				smallSize: 2;
				mediumSize: 4;
				with: [
					html render: (TBCategoriesComponent
								 categories: self blog allCategories
								 postsList: self) ].
			html column
				extraSmallSize: 12;
				smallSize: 10;
				mediumSize: 8;
				with: [
					self readSelectedPosts do: [ :p |
							html render: (TBPostComponent new post: p) ] ] ] ]
]
