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
TBBlog >> allPosts [

	^ posts
]

{ #category : #accessing }
TBBlog >> allVisibleBlogPosts [

	^ posts select: [ :post | post isVisible ]
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
TBBlog >> size [

	^ posts size
]

{ #category : #writing }
TBBlog >> writeBlogPost: aPost [
	"Add the blog post to the list of posts."

	posts add: aPost
]
