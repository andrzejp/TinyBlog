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

{ #category : 'rendering' }
TBPostsListComponent >> categoriesComponent [

	^ TBCategoriesComponent
		  categories: self blog allCategories
		  postsList: self
]

{ #category : 'accessing' }
TBPostsListComponent >> currentCategory [

	^ currentCategory
]

{ #category : 'accessing' }
TBPostsListComponent >> currentCategory: anObject [

	currentCategory := anObject
]

{ #category : 'rendering' }
TBPostsListComponent >> postComponentFor: aPost [

	^ TBPostComponent new post: aPost
]

{ #category : 'as yet unclassified' }
TBPostsListComponent >> readSelectedPosts [

	^ self currentCategory
		  ifNil: [ self blog allVisibleBlogPosts ]
		  ifNotNil: [
		  self blog allVisibleBlogPostsFromCategory: self currentCategory ]
]

{ #category : 'rendering' }
TBPostsListComponent >> renderCategoryColumnOn: html [

	html column
		extraSmallSize: 12;
		smallSize: 2;
		mediumSize: 4;
		with: [ html render: self categoriesComponent ]
]

{ #category : 'rendering' }
TBPostsListComponent >> renderContentOn: html [

	super renderContentOn: html.
	html container: [
		html row with: [
			self renderCategoryColumnOn: html.
			self renderPostColumnOn: html ] ]
]

{ #category : 'rendering' }
TBPostsListComponent >> renderPostColumnOn: html [

	^ html column
		  extraSmallSize: 12;
		  smallSize: 10;
		  mediumSize: 8;
		  with: [
			  self readSelectedPosts do: [ :p |
					  html render: (self postComponentFor: p) ] ]
]
