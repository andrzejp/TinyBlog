Class {
	#name : #TBBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'TinyBlog-Base'
}

{ #category : #'as yet unclassified' }
TBBlog class >> createDemoPosts [
	"TBBlog createDemoPosts"

	self current
		writeBlogPost: ((TBPost
				  title: 'Welcome in TinyBlog'
				  text: 'TinyBlog is a small blog engine made with Pharo.'
				  category: 'TinyBlog') visible: true);
		writeBlogPost: ((TBPost
				  title: 'Report Pharo Sprint'
				  text:
					  'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a
nice event with more than 15 motivated sprinters. With the help
of candies, cakes and chocolate, huge work has been done'
				  category: 'Pharo') visible: true);
		writeBlogPost: ((TBPost
				  title: 'Brick on top of Bloc -
Preview'
				  text: 'We are happy to announce the first preview
version of Brick, a new widget set created from scratch on top
of Bloc. Brick is being developed primarily by Alex Syrel
(together with Alain Plantec, Andrei Chis and myself), and the
work is sponsored by ESUG.
Brick is part of the Glamorous Toolkit effort and will provide
the basis for the new versions of the development tools.'
				  category: 'Pharo') visible: true);
		writeBlogPost: ((TBPost
				  title: 'The sad story of unclassified
blog posts'
				  text: 'So sad that I can read this.') visible: true);
		writeBlogPost: ((TBPost
				  title: 'Working with Pharo on the
Raspberry Pi'
				  text: 'Hardware is getting cheaper and many new
small devices like the famous Raspberry Pi provide new
computation power that was one once only available on regular
desktop computers.'
				  category: 'Pharo') visible: true)
]

{ #category : #accessing }
TBBlog class >> current [
	"Answer the instance of the TBRepository"

	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #'class initialization' }
TBBlog class >> initialize [

	self reset
]

{ #category : #'class initialization' }
TBBlog class >> reset [

	uniqueInstance := nil
]

{ #category : #accessing }
TBBlog >> allBlogPostsFromCategory: aCategory [

	^ posts select: [ :post | post category = aCategory ]
]

{ #category : #accessing }
TBBlog >> allCategories [

	^ (posts collect: [ :post | post category ]) asSet
]

{ #category : #accessing }
TBBlog >> allPosts [

	^ posts
]

{ #category : #accessing }
TBBlog >> allVisibleBlogPosts [

	^ posts select: [ :post | post isVisible ]
]

{ #category : #accessing }
TBBlog >> allVisibleBlogPostsFromCategory: aCategory [

	^ (self allBlogPostsFromCategory: aCategory) select: [ :post |
		  post isVisible ]
]

{ #category : #accessing }
TBBlog >> catetegoriesWithVisiblePosts [

	^ (posts
		   select: [ :p | p isVisible ]
		   thenCollect: [ :p | p category ]) asSet
]

{ #category : #accessing }
TBBlog >> deleteCategoryAndPosts: aCategory [

	posts removeAllSuchThat: [ :p | p category = aCategory ]
]

{ #category : #initialization }
TBBlog >> initialize [ 
	super initialize.
	posts := OrderedCollection new
]

{ #category : #removing }
TBBlog >> removeAllPosts [

	posts := OrderedCollection new
]

{ #category : #accessing }
TBBlog >> renameCategory: aCategory toBe: newCategory [

	posts := posts collect: [ :p |
		         p category = aCategory
			         ifTrue: [ p category: newCategory ]
			         ifFalse: [ p ] ]
]

{ #category : #accessing }
TBBlog >> size [

	^ posts size
]

{ #category : #writing }
TBBlog >> writeBlogPost: aPost [
	"Add the blog post to the list of posts."

	posts add: aPost
]
