"
I am the command allowing one to rerun a single test case of a test-run.
"
Class {
	#name : 'DTRerunSelectedTestCommand',
	#superclass : 'DTResultCommand',
	#category : 'DrTests-TestsRunner-Commands',
	#package : 'DrTests-TestsRunner',
	#tag : 'Commands'
}

{ #category : 'executing' }
DTRerunSelectedTestCommand >> execute [

	| testCase rerunConfig |
	testCase := self context resultsList selection selectedItem content.
	testCase ifNil: [ ^ self inform: 'No test selected.' ].

	(testCase isKindOf: TestCase) ifFalse: [
		^ self inform: 'Selected item is not a test case.' ].

	rerunConfig := DTReRunConfiguration new
		               originalConfiguration:
			               self context drTests testsConfiguration;
		               previousResult: self context drTests pluginResult;
		               configurationToRun:
			               (DTTestsRunnerConfiguration items: { testCase });
		               yourself.

	self context drTests runPluginFor: rerunConfig
]

{ #category : 'initialization' }
DTRerunSelectedTestCommand >> initialize [

	super initialize.
	self name: 'Re-run this test'
]
