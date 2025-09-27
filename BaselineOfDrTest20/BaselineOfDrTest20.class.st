Class {
	#name : 'BaselineOfDrTest20',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfDrTest20',
	#package : 'BaselineOfDrTest20'
}

{ #category : 'baselines' }
BaselineOfDrTest20 >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'DrTests';
				package: 'DrTests-TestsRunner' with: [ spec requires: #('DrTests') ];
				package: 'DrTests-TestCoverage' with: [ spec requires: #('DrTests') ];
				package: 'DrTests-TestsProfiling' with: [ spec requires: #('DrTests') ];
				package: 'DrTests-Tests' with: [ spec requires: #('DrTests' 'DrTests-TestsRunner' 'DrTests-TestCoverage-Tests-Mocks') ];
				package: 'DrTests-TestCoverage-Tests' with: [ spec requires: #('DrTests-TestCoverage' 'DrTests-TestCoverage-Tests-Mocks') ];
				package: 'DrTests-TestsProfiling-Tests' with: [ spec requires: #('DrTests-TestsProfiling') ];
				package: 'DrTests-TestCoverage-Tests-Mocks' with: [ spec requires: #('DrTests-TestCoverage') ];
				package: 'DrTests-CommentsToTests' with: [ spec requires: #('DrTests' 'DrTests-TestsRunner') ];
				package: 'DrTests-CommentsToTests-Tests' with: [ spec requires: #('DrTests-CommentsToTests') ];
				package: 'PharoDocComment' with: [ spec requires: #('DrTests') ];
				package: 'PharoDocComment-Tests' with: [ spec requires: #('PharoDocComment') ]]
]

{ #category : 'baselines' }
BaselineOfDrTest20 >> postload: loader package: packageSpec [

	self tools register: DrTests as: #testRunner
]
