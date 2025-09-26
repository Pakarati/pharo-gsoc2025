"
I build a tree with information: 
-percent of covered methods in the selected packages
-List of the uncovered methods
I am used in DrTestsUI to show the results in a orderly manner.
"
Class {
	#name : 'DTTestCoverageResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'methodList',
		'percent',
		'partiallyCoveredMethods',
		'fullyCoveredMethods',
		'listAllMethods'
	],
	#category : 'DrTests-TestCoverage',
	#package : 'DrTests-TestCoverage'
}

{ #category : 'accessing' }
DTTestCoverageResult >> buildTreeForUI [

	<dtTestCoverageResultTreeNamed: 'Uncovered methods' order: 1>
	^ DTTreeNode new subResults: (self methodList
			   ifNotNil: [
				   {
					   (DTTreeNode new
						    name:
							    (percent * 100 printShowingDecimalPlaces: 2)
							    , ' % Code Coverage';
						    subResults: {  };
						    yourself).
					   (DTTreeNode new
						    name: 'Uncovered methods';
						    subResults:
							    (self methodList collect: [ :each | each asResultForDrTest ]);
						    yourself) } ]
			   ifNil: [
				   { (DTTreeNode new
					    name: 'no package has been selected';
					    subResults: {  };
					    yourself) } ])

]

{ #category : 'as yet unclassified' }
DTTestCoverageResult >> buildTreeForUICovered [

	<dtTestCoverageResultTreeNamed: 'Covered methods' order: 3>
	^ DTTreeNode new subResults: (self fullyCoveredMethods
			   ifNotEmpty: [
				   {
					   (DTTreeNode new
						    name:
							    (self fullyCoveredMethods size
							     / self listAllMethods size asFloat * 100
								     printShowingDecimalPlaces: 2) , ' % Fully Covered';
						    subResults: {  };
						    yourself).
					   (DTTreeNode new
						    name: 'Covered methods';
						    subResults:
							    (self fullyCoveredMethods collect: [ :each |
									     each asResultForDrTest ]);
						    yourself) } ]
			   ifEmpty: [
				   { (DTTreeNode new
					    name: 'No covered methods';
					    subResults: {  };
					    yourself) } ])

]

{ #category : 'as yet unclassified' }
DTTestCoverageResult >> buildTreeForUIPartiallyCovered [

	<dtTestCoverageResultTreeNamed: 'Partially covered methods' order: 2>
	^ DTTreeNode new subResults: (self partiallyCoveredMethods
			   ifNotEmpty: [
				   {
					   (DTTreeNode new
						    name:
							    (self partiallyCoveredMethods size
							     / self listAllMethods size asFloat * 100
								     printShowingDecimalPlaces: 2) , ' % Partially Covered';
						    subResults: {  };
						    yourself).

					   (DTTreeNode new
						    name: 'Partially covered methods';
						    subResults:
							    (self partiallyCoveredMethods collect: [ :each |
									     each asResultForDrTest ]);
						    yourself) } ]
			   ifEmpty: [
				   { (DTTreeNode new
					    name: 'No partially covered methods';
					    subResults: {  };
					    yourself) } ])

]

{ #category : 'accessing' }
DTTestCoverageResult >> fullyCoveredMethods [

	^ fullyCoveredMethods

]

{ #category : 'accessing' }
DTTestCoverageResult >> fullyCoveredMethods: aCollectionOfMethods [

	fullyCoveredMethods := aCollectionOfMethods

]

{ #category : 'accessing' }
DTTestCoverageResult >> listAllMethods [


	^ listAllMethods

]

{ #category : 'accessing' }
DTTestCoverageResult >> listAllMethods: aCollectionOfMethods [

	listAllMethods := aCollectionOfMethods

]

{ #category : 'accessing' }
DTTestCoverageResult >> methodList [
	^methodList
]

{ #category : 'accessing' }
DTTestCoverageResult >> methodList: aCollectionOfMethods [
	methodList := aCollectionOfMethods
]

{ #category : 'accessing' }
DTTestCoverageResult >> partiallyCoveredMethods [

	^ partiallyCoveredMethods
]

{ #category : 'accessing' }
DTTestCoverageResult >> partiallyCoveredMethods: aCollectionOfMethods [

	partiallyCoveredMethods := aCollectionOfMethods
]

{ #category : 'accessing' }
DTTestCoverageResult >> percent [
	^ percent
]

{ #category : 'accessing' }
DTTestCoverageResult >> percent: anObject [
	percent := anObject
]

{ #category : 'accessing' }
DTTestCoverageResult >> summarizeInfo [
	"Text showed in miniDrTests with info of the result "

	^ String
		streamContents: [ :s |
			s
				<< (percent*100 printShowingDecimalPlaces: 2);
				<< ' % Code Coverage';
				<< String cr;
				<< 'Uncovered methods:';
				<< String cr;
				<< self methodList size asString ]
]
