Class {
	#name : #TBBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first'
	],
	#category : #'TinyBlog-Tests'
}

{ #category : #running }
TBBlogTest >> setUp [

	super setUp.
	blog := TBBlog current.
	blog removeAllPosts.

	first := TBPost
		         title: 'A title'
		         text: 'A text'
		         category: 'First Category'.
	blog writeBlogPost: first.

	post := (TBPost
		         title: 'Another title'
		         text: 'Another text'
		         category: 'Second Category') beVisible
]

{ #category : #running }
TBBlogTest >> tearDown [

	TBBlog reset.
	super tearDown
]

{ #category : #tests }
TBBlogTest >> testAddBlogPost [

	blog writeBlogPost: post.
	self assert: blog size equals: 2
]

{ #category : #tests }
TBBlogTest >> testAllBlogPosts [

	blog writeBlogPost: post.
	self assert: blog allPosts size equals: 2
]

{ #category : #tests }
TBBlogTest >> testAllBlogPostsFromCategory [

	self
		assert: (blog allBlogPostsFromCategory: 'First Category') size
		equals: 1
]

{ #category : #tests }
TBBlogTest >> testAllCategories [

	blog writeBlogPost: post.
	self assert: blog allCategories size equals: 2
]

{ #category : #tests }
TBBlogTest >> testAllVisibleBlogPosts [

	blog writeBlogPost: post.
	self assert: blog allVisibleBlogPosts size equals: 1
]

{ #category : #tests }
TBBlogTest >> testAllVisibleBlogPostsFromCategory [

	blog writeBlogPost: post.
	self
		assert:
		(blog allVisibleBlogPostsFromCategory: 'First Category') size
		equals: 0.
	self
		assert:
		(blog allVisibleBlogPostsFromCategory: 'Second Category') size
		equals: 1
]

{ #category : #tests }
TBBlogTest >> testCategoriesWithVisiblePosts [

	blog writeBlogPost: post.
	self
		assertCollection: blog catetegoriesWithVisiblePosts
		hasSameElements: #( 'Second Category' )
]

{ #category : #tests }
TBBlogTest >> testDeleteCategoryAndPosts [

	| newPost |
	newPost := TBPost new category: 'New Category'.
	blog writeBlogPost: newPost.
	self assert: blog allPosts size equals: 2.
	self assert: (blog allPosts includes: newPost).

	blog deleteCategoryAndPosts: 'New Category'.

	self assert: blog allPosts size equals: 1.
	self deny: (blog allPosts includes: newPost)
]

{ #category : #tests }
TBBlogTest >> testRemoveAllBlogPosts [

	blog removeAllPosts.
	self assert: blog size equals: 0
]

{ #category : #tests }
TBBlogTest >> testRenameCategory [

	| postInCategoryA anotherPostInCategoryA |
	postInCategoryA := TBPost new category: 'A'.
	anotherPostInCategoryA := TBPost new category: 'A'.
	blog writeBlogPost: postInCategoryA.
	blog writeBlogPost: anotherPostInCategoryA.

	self
		assertCollection: (blog allBlogPostsFromCategory: 'A')
		includesAll: {
				postInCategoryA.
				anotherPostInCategoryA }.

	blog renameCategory: 'A' toBe: 'B'.

	self assert: (blog allBlogPostsFromCategory: 'A') isEmpty.
	self
		assertCollection: (blog allBlogPostsFromCategory: 'B')
		includesAll: {
				postInCategoryA.
				anotherPostInCategoryA }
]

{ #category : #tests }
TBBlogTest >> testSize [

	self assert: blog size equals: 1
]

{ #category : #tests }
TBBlogTest >> testUnclassifiedBlogPosts [

	self
		assert: (blog allPosts select: [ :p | p isUnclassified ]) size
		equals: 0
]
