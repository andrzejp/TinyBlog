Class {
	#name : #TBCategoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'categories',
		'postsList'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'as yet unclassified' }
TBCategoriesComponent class >> categories: categories postsList: aTBScreen [

	^ self new
		  categories: categories;
		  postsList: aTBScreen
]

{ #category : #accessing }
TBCategoriesComponent >> categories [

	^ categories
]

{ #category : #accessing }
TBCategoriesComponent >> categories: aCollection [

	categories := aCollection asSortedCollection
]

{ #category : #accessing }
TBCategoriesComponent >> postsList [

	^ postsList
]

{ #category : #accessing }
TBCategoriesComponent >> postsList: aComponent [

	postsList := aComponent
]

{ #category : #actions }
TBCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [

	html listGroupLinkedItem
		callback: [ self selectCategory: aCategory ];
		with: aCategory
]

{ #category : #rendering }
TBCategoriesComponent >> renderContentOn: html [

	html listGroup: [
		html listGroupItem with: [ html strong: 'Categories' ].
		categories do: [ :cat | self renderCategoryLinkOn: html with: cat ] ]
]

{ #category : #rendering }
TBCategoriesComponent >> rendererClass [

	^ SBSHtmlCanvas
]

{ #category : #actions }
TBCategoriesComponent >> selectCategory: aCategory [

	postsList currentCategory: aCategory
]
