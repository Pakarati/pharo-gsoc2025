"
I build a tree with the testsResult created by comments listed in groups: 
- Errors
- Failures
- Passed test
I am used in DrTestsUI to show the results in a orderly manner.
"
Class {
	#name : 'DTCommentToTestResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'testsResult'
	],
	#category : 'DrTests-CommentsToTests-Base',
	#package : 'DrTests-CommentsToTests',
	#tag : 'Base'
}

{ #category : 'tree building' }
DTCommentToTestResult >> buildLeavesFrom: aCollection type: testResultType [

	^ aCollection collect: [ :t |
		  DTTestLeafNode content: t type: testResultType ]
]

{ #category : 'as yet unclassified' }
DTCommentToTestResult >> buildNodeGroupedByTypeClassAndMethod: anOrderedCollection type: testResultType [

	^ DTTreeNode new
		  name: testResultType pluralName;
		  subResults: ((anOrderedCollection groupedBy: [ :testCase |
					    testCase methodSource methodClass ]) associations collect: [
					   :assoc |
					   DTTreeNode new
						   name: assoc key name;
						   subResults: ((assoc value groupedBy: [ :testCase |
									     | method |
									     method := testCase methodSource selector.
									     method ]) associations collect: [ :methodToTest |
									    DTTreeNode new
										    name: methodToTest key;
										    subResults:
											    (self
												     buildLeavesFrom: methodToTest value
												     type: testResultType);
										    yourself ]);
						   yourself ]);
		  yourself
]

{ #category : 'accessing' }
DTCommentToTestResult >> buildTreeForUI [
 
	<dtCommentToTestResultTreeNamed: 'Grouped by type of result' order: 1>
	^ DTTreeNode new
		  subResults: {
				  (DTTreeNode new
					   name: 'Errors';
					   subResults:
						   (self testResults errors collect: [ :each |
								    each asResultForDrTest ]);
					   startExpanded;
					   displayColorIfNotEmpty:
						   TestResult defaultColorBackGroundForErrorTest;
					   yourself).
				  (DTTreeNode new
					   name: 'Failures';
					   subResults: (self testResults failures
							    collect: [ :each | each asResultForDrTest ]
							    as: OrderedCollection);
					   startExpanded;
					   displayColorIfNotEmpty:
						   TestResult defaultColorBackGroundForFailureTest;
					   yourself).
				  (DTTreeNode new
					   name: 'Passed tests';
					   subResults:
						   (self testResults passed collect: [ :each |
								    each asResultForDrTest ]);
					   displayColorIfNotEmpty:
						   TestResult defaultColorBackGroundForPassingTest;
					   yourself) };
		  yourself

]

{ #category : 'as yet unclassified' }
DTCommentToTestResult >> buildTreeForUIByClassesAndMethod [

	<dtCommentToTestResultTreeNamed:
	'Grouped by type of result, classes, and Method' order: 3>
	| errors failures skipped passed |
	errors := self
		          buildNodeGroupedByTypeClassAndMethod:
		          self testResults errors
		          type: DTTestResultType error.
	failures := self
		            buildNodeGroupedByTypeClassAndMethod:
		            self testResults failures asOrderedCollection
		            type: DTTestResultType fail.
	skipped := self
		           buildNodeGroupedByTypeClassAndMethod:
		           self testResults skipped
		           type: DTTestResultType skipped.
	passed := self
		          buildNodeGroupedByTypeClassAndMethod:
		          self testResults passed
		          type: DTTestResultType pass.
	^ DTTreeNode new
		  subResults: {
				  errors.
				  failures.
				  skipped.
				  passed };
		  yourself
]

{ #category : 'accessing' }
DTCommentToTestResult >> testResults [
	^ testsResult
]

{ #category : 'accessing' }
DTCommentToTestResult >> testResults: anObject [
	testsResult := anObject
]
